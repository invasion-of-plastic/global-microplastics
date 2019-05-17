// Daniel Shiffman
// http://codingtra.in
// Earthquake Data Viz
// Video: https://youtu.be/ZiYdOwOrGyc



PImage mapimg;

int clat = 0;
int clon = 0;

int ww = 1280;
int hh = 640;

int zoom = 1;
String[] earthquakes;


float mercX(float lon) {
  lon = radians(lon);
  float a = (256 / PI) * pow(2, zoom);
  float b = lon + PI;
  return a * b;
}

float mercY(float lat) {
  lat = radians(lat);
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + lat / 2);
  float c = PI - log(b);
  return a * c;
}


void setup() {
  size(1280, 640);
  // The clon and clat in this url are edited to be in the correct order.
  String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
    clon + "," + clat + "," + zoom + "/" +
    ww + "x" + hh +
    "?access_token=pk.eyJ1IjoiY29kaW5ndHJhaW4iLCJhIjoiY2l6MGl4bXhsMDRpNzJxcDh0a2NhNDExbCJ9.awIfnl6ngyHoB3Xztkzarw";
  mapimg = loadImage(url, "jpg");
  println(url);
  // earthquakes = loadStrings("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.csv");
  //earthquakes = loadStrings("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv");


  translate(width / 2, height / 2);
  imageMode(CENTER);
  image(mapimg, 0, 0);

  float cx = mercX(clon);
  float cy = mercY(clat);
  
    
    //console.log(data);
    float lat = 41.89193;
    float lon = 12.51133;
    //float mag = float(data[4]);
    float x = mercX(lon) - cx;
    float y = mercY(lat) - cy;
    // This addition fixes the case where the longitude is non-zero and
    // points can go off the screen.
    if(x < - width/2) {
      x += width;
    } else if(x > width / 2) {
      x -= width;
    }
    //mag = pow(10, mag);
    //mag = sqrt(mag);
    //float magmax = sqrt(pow(10, 10));
    //float d = map(mag, 0, magmax, 0, 180);
    float d = 10;
    stroke(255, 0, 255);
    fill(255, 0, 255, 200);
    ellipse(x, y, d, d);
}
