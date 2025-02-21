
# Smart Semester - Term Plan Management System


**Smart Semester** is a mobile application developed to address the challenges university students face in accessing and organizing academic information. Designed with ease of use in mind, the app offers students a centralized platform where they can access faculty contact details, university-wide notices, course materials, and more. With real-time notifications and secure login, Smart Semester keeps students connected and informed, ensuring they never miss out on crucial academic updates.

## Features

- **Student Registration & Login**: Secure login and registration via Firebase Authentication, ensuring students' data is protected.
- **Faculty Information**: View faculty member details such as name, position, and contact information for easy communication with professors.
- **Notices Section**: Stay informed about important updates with categorized notices – university-wide and class-specific.
- **Course Materials**: Access to resources such as Google Drive links, Google Classroom, and WhatsApp groups for each enrolled course.
- **Push Notifications**: Real-time updates through Firebase Cloud Messaging to ensure students receive timely notifications about important events and deadlines.
- **Questions Bank**: Access previous year’s exam questions for respective courses, helping students prepare better for exams.
- **PDF Books**: Download necessary textbooks for courses throughout the semester in PDF format.
- **Reference Links**: Links to essential resources like the BAIUST official website, faculty Facebook groups, and other academic materials.
- **Picture Slider**: An interactive slider on the home page displaying key images like class routines, bus schedules, etc.
- **Drawer Menu**: Provides quick access to key sections like Profile, Academic Calendar, IUMSS, and Logout.
- **Profile Page**: Displays user details such as username, phone number, and email with the option to update.
- **Forgot Password**: Allows users to reset their password through email verification.
- **Settings**: Manage profile updates, security settings (e.g., password change), and more.
- **Logout**: Easy logout option from the Profile and Drawer menu with a confirmation dialog.

## Technologies Used

- **Frontend**: Flutter for the mobile app development, providing a fast and responsive user interface.
- **Backend**: Firebase for real-time data synchronization, user authentication, and push notifications.
- **Push Notifications**: Firebase Cloud Messaging (FCM) for sending instant notifications about new updates.
- **Database**: Firebase Firestore to securely store user data, notices, faculty information, and course resources.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sarkarjoy86/smart-semester.git
   ```

2. Navigate to the project directory:
   ```bash
   cd smart-semester
   ```

3. Open the project in Android Studio or your preferred IDE.

4. Build and run the project on your Android device or emulator.

## Database Structure

Smart Semester uses Firebase Firestore for data storage. The main collections include:

- **Users**: Stores user details such as email, phone, and full name.
- **Faculty Members**: Contains faculty member information, including their name, position, email, and phone number.
- **Notices**: Contains university-wide and class-specific notices with details like the title, body, and category.
- **Courses**: Stores information about the courses, including course name, course code, material links, and faculty contact details.

## How to Use

1. **Register**: Students can sign up with their name, email, and phone number.
2. **Login**: After registration, students log in to access their personalized academic information.
3. **Faculty Information**: View a list of faculty members, including contact details for easier communication.
4. **Notices**: Check for university-wide and class-specific notices to stay updated on important deadlines and events.
5. **Courses**: Access enrolled course details, including resource links such as Google Drive, Google Classroom, and WhatsApp groups.
6. **Push Notifications**: Receive real-time notifications about new notices, assignments, or any changes.
7. **Questions Bank**: Review past exam questions for your courses.
8. **PDF Books**: Download textbooks for the current semester.
9. **Reference Links**: Access key academic resources and university links.
10. **Picture Slider**: View important academic images like class routines and bus schedules.
11. **Drawer Menu**: Navigate quickly to key app sections such as Profile, Academic Calendar, and Settings.
12. **Settings**: Update profile details and manage security settings.
13. **Push Notifications**: Receive instant updates for all important academic events.

## Future Enhancements

- **Dark Mode**: A dark theme to provide a comfortable reading experience during night-time study sessions.
- **University Navigation**: An interactive campus map feature to help students find key university locations.
- **Personalized Dashboard**: A dashboard summarizing a student's academic progress, including deadlines, assignments, and grades.
- **LMS Integration**: Integration with learning management systems (LMS) like Moodle, Canvas, or Blackboard to centralize course materials, grades, and feedback.

## Contributions

Feel free to fork the repository, create a new branch, and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or issues, feel free to reach out to the project owner:
- Email: [joysarkar1086@gmail.com](mailto:joysarkar1086@gmail.com)
- GitHub: [sarkarjoy86](https://github.com/sarkarjoy86)
