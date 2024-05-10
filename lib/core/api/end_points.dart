class EndPoints {
  const EndPoints._();

  // Authentication Endpoints
  static const String baseUrl = 'https://muhamaty.com/api/v1/';
  static const String register = 'register-api';
  static const String login = 'login-api';
  static const String logout = 'logout-api';
  static const String autoLogin = 'remember-me-api';
  static const String sendCode = 'send-code-api';
  static const String sendEmailVerificationCode = 'send-otp-update';
  static const String verifyCode = 'verfiy-code-api';
  static const String verifyCodeRegister = 'verfiy-code-register';
  static const String resetPassword = 'reset-password-api';
  static const String getManagerTasks = 'get-tasks';
  static const String getEmployeesTasks = 'get-user-tasks';
  static const String changeTaskStatus = 'change-task-status';
  static const String changePassword = 'update-password-api';
  static const String updateProfile = 'update-profile-api';
  static const String updateOrganization = 'update-organization-api';
  static const String getOrganizationUsers = 'get-organization-user';
  static const String createTask = 'tasks';
  static const String updateCategories = 'delete-category';
  static const String updateTask = 'tasks';
  static const String deleteTask = 'tasks';
  static const String getTop3 = 'get-top-3';
  static const String makeReport = 'generate-pdf';
  static const String sendNotification = 'chat';
}
