require 'rails_helper'

RSpec.describe "Direction object" do
  it 'exists' do
    data =
    {:route=>
    {:hasTollRoad=>false,
     :hasBridge=>true,
     :boundingBox=>{:lr=>{:lng=>-104.98484, :lat=>39.612652}, :ul=>{:lng=>-105.020981, :lat=>39.738453}},
     :distance=>10.057,
     :hasTimedRestriction=>false,
     :hasTunnel=>false,
     :hasHighway=>false,
     :computedWaypoints=>[],
     :routeError=>{:errorCode=>-400, :message=>""},
     :formattedTime=>"01:45:23",
     :sessionId=>"6226a9a7-02bb-5f21-02b4-3594-0616c0635f8d",
     :hasAccessRestriction=>false,
     :realTime=>1483,
     :hasSeasonalClosure=>false,
    }
    }

  directions = Direction.new(data)

  expect(directions).to be_a Direction
  expect(directions.hour).to eq(1)
  expect(directions.min).to eq(45)
  expect(directions.rounded_hours).to eq(2)
  end
end
