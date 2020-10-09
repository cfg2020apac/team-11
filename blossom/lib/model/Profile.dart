class Profile {
  String name;
  String noOfcompletedEvents;
  String noOfUpComingEvents;
  String imageUrl;
  List<String> completedEvents;

  Profile(String name, String noOfcompletedEvents, String noOfUpComingEvents, List<String> completed, String imageUrl){
    this.name = name;
    this.noOfcompletedEvents = noOfcompletedEvents;
    this.noOfUpComingEvents = noOfUpComingEvents;
    this.imageUrl = imageUrl;
    this.completedEvents = completed;
  }
}