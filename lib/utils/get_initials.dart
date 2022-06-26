//Utils folders are used to store  functions that are used in multiple places.


String getInitials(String message){
  if(message.length >1){
    return message.substring(0,message.length);
  }else{
    return message;
  }
}








// String getInitials(String name) {
//   if (name == null || name.isEmpty) {
//     return '';
//   }
//   List<String> nameSplit = name.split(' ');
//   String firstName = nameSplit[0];
//   String lastName = nameSplit[1];
//   return firstName[0] + lastName[0];
// }