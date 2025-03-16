<h1> TERRAIN GENERATION PROJECT </h1>
This was just an attempt at learning the godot 4 game engine, learning how the framework works and how game dev is to be done with godot 
<br>
The project was made in the Godot v4.2.1 stable version.
<br>
The project is about 2D tile-based terrain generation, like in the game terraria.
The project uses the FastNoiseLite class to generate noise, which is then sampled per pixel to get the noise value. The noise sampling is done using the framework provided by the TileMap node.
The "layer" variable works as a fag for switching the texture of each tile, hence the tile type changes when we go down the ground layer. Features such as Mountains, plaines or small pockets of space can be created based on the horizontal coordinate(which represents height). The generated terrain is simply the result of sampling two noise functions and using them to create tiles with the method described above.
<br>
<br>
<h1>Final Output</h1>
<img src="/ProjectOutput/TerainFull.png">
<img src="/ProjectOutput/TerrainMountainCloseup.png">
<img src="/ProjectOutput/TerrainCloseup.png">
<!-- <video src="/ProjectOutput/TestRun.mp4" > -->
<!-- <video width="320" height="240" controls>
  <source src="/ProjectOutput/TestRun.mp4" type="video/mp4">
</video> -->
![TestRun](/ProjectOutput/TestRun.mp4)