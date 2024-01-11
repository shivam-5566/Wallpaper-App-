class PhotosModel{
  String imgsrc;
  String PhotoName;

  PhotosModel({required this.imgsrc,required this.PhotoName});

  static PhotosModel fromAPI2App(Map<String,dynamic> photoMap){
    return PhotosModel(imgsrc: (photoMap["src"]["portrait"]), PhotoName: photoMap["photographer"]);
  }
}