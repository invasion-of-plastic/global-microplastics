//Plastic Pollution Visualization
//12.05.2019
//by Scorpio

//OBIETTIVO
//GEOLOCALIZZAZIONE DEI CAMPIONI => colonne 10 e 11 => 9 e 10 dell'array
//successivamente ampiezza dei campioni

//VARIABILI DATI
Table marine, freshwater;
float[] latitudeValues, longitudeValues;


PImage webImg;


void setup() {
  pixelDensity(2);
  size(600, 600);
  //orientation(LANDSCAPE);
  //textAlign(CENTER, CENTER);
  //textSize(36);
  getData();
  
  String url = ("https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/0,0,2/600x600?access_token=pk.eyJ1IjoidGFuaWFzY29ycGlvIiwiYSI6ImNqdmxkbmp4NTB2bG80OW9hbGdvcW5udHUifQ.OV_7-oDWAFl70mAW5k0BtQ");
  // Load image from a web server
  webImg = loadImage(url, "png");
}


void draw() {
  background(0);
  image(webImg, 0, 0);
}


void getData() {

  //LOADING TABLE
  // [0] , [1] , [2] , [3] , [4] 
  marine = loadTable("marine.csv", "header");
  freshwater = loadTable("freshwater.csv", "header");
  
  //inizzializzazione degli array marine.csv
  latitudeValues = new float[marine.getRowCount()];
  longitudeValues = new float[marine.getRowCount()];
  
  //riempio gli array
  for (int i = 0; i < marine.getRowCount(); i++) {
    latitudeValues[i] = marine.getFloat(i, 9);
    longitudeValues[i] = marine.getFloat(i, 10);
  }
  
  //debug
  //printArray("LATITUDE: " + latitudeValues + " LONGITUDE: " + longitudeValues);
  //printArray(latitudeValues);
  printArray(longitudeValues);
  
  
}
