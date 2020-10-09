class Profile {
  String name;
  String noOfcompletedEvents;
  String noOfUpComingEvents;
  String imageUrl;
  List<String> completedEvents;

  Profile(String name, String noOfcompletedEvents, String noOfUpComingEvents, List<String> completed){
    this.name = name;
    this.noOfcompletedEvents = noOfcompletedEvents;
    this.noOfUpComingEvents = noOfUpComingEvents;
    this.imageUrl = "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";
    this.completedEvents = completed;
  }
}