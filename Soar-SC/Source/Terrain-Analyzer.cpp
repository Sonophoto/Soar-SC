#include "Terrain-Analyzer.h" //Include for TerrainAnalyzer class header

#include "Soar_Link.h" //For Soar_Link class header

#include <sstream> //For std::stringstream

using namespace std; //Allow use of string instead of std::string for example
using namespace sml;

int thread_runner(void* data) //Terrain Analyzer thread
{
	reinterpret_cast<TerrainAnalyzer*>(data)->mapping_function(); //Calls the mapping function to generate the svs representation of the map

	return 0;
}

TerrainAnalyzer::TerrainAnalyzer(const std::vector<std::vector<bool> > &map, sml::Agent* agent, SDL_mutex* mu) //Main constructor
	: out("bwapi-data/logs/test_input-terrain.txt") //Output file for the map
{
	if (!out.is_open()) //Check to make sure it is open otherwise stop working on the map
		return;

	this->map = map;

	this->agent = agent;

	this->mu = mu;

	this->should_die = false;
	this->done_svs = false;
}

TerrainAnalyzer::~TerrainAnalyzer() //Deconstructor
{
	if (!out.is_open())
		return;

	if (thread)
	{
		SDL_WaitThread(thread,NULL);
		thread = NULL;
	}
}

void TerrainAnalyzer::analyze() //Main analyzer function, just creates a thread of the analyzer
{
	if (!out.is_open())
		return;

	thread = SDL_CreateThread(thread_runner, "Terrain Analyzer", this);
}

bool TerrainAnalyzer::rectangle_contains(const int x,const int y,vector<SVS_Rectangle> &rectangles) //Check whether a rectangle contains the given point
{
	SVS_Rectangle rect = get_rectangle(x,y,rectangles);
	
	if (rect.x == -1)
		return false;

	return true;
}

TerrainAnalyzer::SVS_Rectangle TerrainAnalyzer::get_rectangle(const int x, const int y,vector<SVS_Rectangle> &rectangles) //Get the rectangle containing the given point
{
	for (vector<SVS_Rectangle>::iterator it = rectangles.begin();it != rectangles.end();it++)
	{
		if (it->x <= x && x < it->x + it->size_x &&
			it->y <= y && y < it->y + it->size_y)
			return *it;
	}
	
	SVS_Rectangle rect;
	rect.x = -1;
	rect.y = -1;
	rect.size_x = -1;
	rect.size_y = -1;
	
	return rect;
}

void TerrainAnalyzer::generate_rectangle(const int x_start,const int y_start,vector<vector<bool> > &map, vector<SVS_Rectangle> &rectangles) //Generate the biggest rectangle from the given point
{
	vector<size_t> xs;
	vector<size_t> ys;

	for (size_t y = y_start;y < map.size();y++)
	{
		if (map[y][x_start] || rectangle_contains(x_start, y, rectangles))
			break;

		for (size_t x = x_start;x < map[y].size();x++)
		{
			if (map[y][x] || rectangle_contains(x, y, rectangles))
			{
				xs.push_back(x-x_start);
				break;
			}
		}
	}
	
	size_t min_x = map[0].size()-x_start;
	for (size_t i = 0;i < xs.size();i++)
	{
		if (xs[i] < min_x)
			min_x = xs[i];
	}
	
	for (size_t x = x_start;x < min_x + x_start && x < map.size();x++)
	{
		if (map[y_start][x] || rectangle_contains(x, y_start, rectangles))
			break;
		
		for (size_t y = y_start;y < map.size();y++)
		{
			if (map[y][x] || rectangle_contains(x, y, rectangles))
			{
				ys.push_back(y-y_start);
				break;
			}
		}
	}

	size_t min_y = map.size()-y_start;
	for (size_t i = 0;i < ys.size();i++)
	{
		if (ys[i] < min_y)
			min_y = ys[i];
	}
	
	SVS_Rectangle rect;
	rect.x = x_start;
	rect.y = y_start;
	rect.size_x = min_x ? min_x : 1;
	rect.size_y = min_y ? min_y : 1;

	rectangles.push_back(rect);
}

void TerrainAnalyzer::mapping_function() //Main map function generates the rectangles of the map
{
	vector<SVS_Rectangle> rectangles;

	vector<bool>* start_y = &map[0];

	size_t map_size = map.size();

	for (size_t y = 0;y < map_size && !should_die;y++,start_y++)
	{
		for (size_t x = 0;x < (*start_y).size() && !should_die;x++)
		{
			if (start_y->at(x) || rectangle_contains(x, y, rectangles))
				continue;

			generate_rectangle(x,y,map,rectangles);
		}
	}

	stringstream ss;

	int i = 0;
	for (vector<SVS_Rectangle>::iterator it = rectangles.begin();it != rectangles.end() && !should_die;i++, it++)
	{
		ss << i;
		string id = ss.str();
		ss.str("");

		SVS_Rectangle rect = *it;
		
		ss << ((float)rect.x + 2.0f)/4.0f << " " << Soar_Link::flip_one_d_point(((float)rect.y + (float)rect.size_y)/4.0f, false);

		string pos = ss.str();
		ss.str("");
		
		ss << (float)rect.size_x/4.0f << " " << (float)rect.size_y/4.0f;
		string size = ss.str();
		ss.str("");

		string svs_command = "a rect" + id + " world v " + Soar_Link::unit_box_verts + " p " + pos + " 0 s " + size + " 1";
		out << "SVS-Actual: " << svs_command << endl;

		SDL_mutexP(mu);
		agent->SendSVSInput(svs_command);
		SDL_mutexV(mu);
	}

	cout << "Rectangles: " << rectangles.size() << endl;

	SDL_mutexP(mu);
	done_svs = true;
	SDL_mutexV(mu);
}

bool TerrainAnalyzer::done_sending_svs() //Returns whether the analyzer is done create the map and putting it in svs
{
	if (should_die)
		return true;

	SDL_mutexP(mu);
	bool done = done_svs;
	SDL_mutexV(mu);
	return done;
}