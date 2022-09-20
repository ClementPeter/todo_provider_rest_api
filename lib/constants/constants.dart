// The App url will hold the baseUrl... which is a Constant String we'll attach other url's suffix too
//Static keyword helps the class to access the properties directly without the need for instantiating

class AppUrl {
  static String baseUrl = 'https://wisdommatt-todolist-api.herokuapp.com';
  static String registerUrl =
      'https://wisdommatt-todolist-api.herokuapp.com/users/';
  static String loginUrl =
      'https://wisdommatt-todolist-api.herokuapp.com/users/login';
  static String addTaskUrl =
      'https://wisdommatt-todolist-api.herokuapp.com/tasks/';
        //static String deleteTaskUrl = 'https://wisdommatt-todolist-api.herokuapp.com';
}
