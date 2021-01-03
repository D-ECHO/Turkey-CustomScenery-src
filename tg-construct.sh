case $1 in
	1) geo='--min-lon=28.5 --max-lon=29.0 --min-lat=40.75 --max-lat=41.5';;		# Istanbul
	2) geo='--min-lon=30.0 --max-lon=31.0 --min-lat=36.75 --max-lat=37.25';;	# Antalya
	3) geo='--min-lon=26.75 --max-lon=27.5 --min-lat=38.0 --max-lat=38.75';;	# Izmir
	4) geo='--min-lon=35.0 --max-lon=35.5 --min-lat=36.75 --max-lat=37.25';;	# Adana
	5) geo='--min-lon=27.5 --max-lon=28.0 --min-lat=37.125 --max-lat=37.375';;	# Milas/Bodrum
	6) geo='--min-lon=28.0 --max-lon=29.5 --min-lat=36.5 --max-lat=37.0';;		# Dalaman
esac
echo $1
echo $geo
if [ ! -z "$2" ]  && [ $2 = "light" ]
then
	echo "Light built: Not building Asphalt, Railroad, Strem";
	arg="";
else
	arg="Asphalt Railroad Stream";
fi
tg-construct --work-dir=./work --output-dir=./output/Terrain `echo $geo` --threads=3 --priorities=priorities.txt AirportArea SRTM-3 AirportObj Default Ocean Hole Freeway Road Road-Motorway Road-Trunk Road-Residential Road-Primary Road-Secondary Road-Tertiary Road-Service Road-Pedestrian Road-Steps Road-Unclassified Airport Pond Lake DryLake Reservoir IntermittentLake IntermittentStream Watercourse Canal Cliffs Glacier PackIce PolarIce Ocean Estuary Urban SubUrban Town Fishing Construction Industrial Port Dump FloodLand Lagoon Bog Marsh SaltMarsh Sand Saline Littoral Dirt Rock Lava OpenMining BuiltUpCover Transport Cemetery DryCrop IrrCrop Rice MixedCrop Vineyard Bamboo Mangrove ComplexCrop NaturalCrop CropGrass CropWood AgroForest Olives GolfCourse Greenspace GrassCover Grassland ScrubCover Scrub ShrubGrassCover SavannaCover Orchard DeciduousForest DeciduousBroadCover EvergreenForest EvergreenBroadCover MixedForest RainForest BarrenCover HerbTundra Sclerophyllous Heath Burnt SnowCover Island Default Void Null Unknown River $arg
