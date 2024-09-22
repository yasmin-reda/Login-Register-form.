class User {
  final String username;
  final String password;

  User(this.username, this.password);
}

class UserController {
  final List<User> _users = [];

  // Method to create a new user
  User createUser(String username, String password) {
    // In a real app, you'd likely want to hash passwords and save users to a database
    final user = User(username, password);
    _users.add(user);
    return user;
  }

  // Method to authenticate a user
  User? authenticateUser(String username, String password) {
    for (var user in _users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null; // Return null if no match is found
  }
}
