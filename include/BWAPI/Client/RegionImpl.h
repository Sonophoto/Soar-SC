#pragma once
#include <BWAPI/Region.h>
#include <BWAPI/Position.h>
#include <BWAPI/Client/RegionData.h>

#include <BWAPI/Regionset.h>

namespace BWAPI
{
  class RegionImpl : public Region
  {
  private:
    RegionData *self;
    Regionset neighbors;
    BWAPI::Region *closestAccessibleRgn;
    BWAPI::Region *closestInaccessibleRgn;
  public:
    RegionImpl(int index);
    void setNeighbors();
    virtual int getID() const;
    virtual int getRegionGroupID() const;
    virtual BWAPI::Position getCenter() const;
    virtual bool isHigherGround() const;
    virtual int getDefensePriority() const;
    virtual bool isWalkable() const;

    virtual const Regionset &getNeighbors() const;

    virtual int getBoundsLeft() const;
    virtual int getBoundsTop() const;
    virtual int getBoundsRight() const;
    virtual int getBoundsBottom() const;

    virtual BWAPI::Region *getClosestAccessibleRegion() const;
    virtual BWAPI::Region *getClosestInaccessibleRegion() const;
  };

};

