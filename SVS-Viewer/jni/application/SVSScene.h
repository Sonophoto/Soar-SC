//
//  Scene.h
//  Application
//
//  Created by Alex Turner on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef Application_SVSScene_h
#define Application_SVSScene_h

#include "zenilib.h"

#include <string>
#include <vector>

#include "SVSObject.h"

class SVSScene
{
public:
	SVSScene(std::string name);
	SVSScene(const SVSScene &source);
	
	SVSScene& operator=(const SVSScene &source);
	
	~SVSScene();
	
	bool add_object(std::string name, std::string parent, std::vector<Zeni::Point3f> vertices, Zeni::Point3f position, Zeni::Quaternion rotation, Zeni::Point3f scale);
	
	bool update_object(std::string name, Zeni::Point3f position, Zeni::Quaternion rotation, Zeni::Point3f scale);
	
	bool delete_object(std::string name);
	
	SVSObject* get_object_in_vector(std::string name, std::vector<SVSObject*> &objects);
	SVSObject* get_object_by_name(std::string name);
	
	std::string get_scene_name();
	
	void render();
	void render_wireframe();

	void clear_objects();
	
	SVSObject* find_object(std::string name) { return find_object_in_objects(objects, name); }

private:
	std::string scene_name;
	
	std::vector<SVSObject*> objects;

	SVSObject* find_object_in_objects(std::vector<SVSObject*> &objects, std::string name);
	bool delete_object_recursive(std::string name, std::vector<SVSObject*> &objects);
};

#endif
