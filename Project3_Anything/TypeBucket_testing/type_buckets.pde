class TypeBucket {
  //attributes
  char x, y, z;
  char[] bucketContents = new char[3];

  //contructor
  TypeBucket(char tempX, char tempY, char tempZ) {
    x = tempX;
    y = tempY;
    z = tempZ;
    bucketContents[0] = x;
    bucketContents[1] = y;
    bucketContents[2] = z;
  }

//methods

//select and return a random character from bucketContents
char pullType() {
  return bucketContents[int(random(0, 3))];
}

} //end of TypeBucket