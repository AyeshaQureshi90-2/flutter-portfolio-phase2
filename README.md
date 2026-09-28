# portfolio_phase2
A new Flutter project.
1. Project Overview
In Phase 2 of my Flutter internship, I developed a portfolio builder application called My Portfolio.
The purpose of the application is to allow users to enter their personal and professional information and generate a portfolio from the provided information.
The application follows a simple step-by-step flow. The user starts from the landing page, enters information about themselves, adds their skills and contact details, and then views the final portfolio in a designed layout.
The final portfolio can also be saved as an image to the device Gallery and shared using the device's available sharing options.
2. Features
User-entered portfolio information
About, Skills, and Contact sections
Shared portfolio data between screens
Step-by-step portfolio creation
Designed portfolio preview
Save portfolio as an image
Share portfolio image
3. Packages Used
1.gal
The gal package was used to save the generated portfolio image to the device Gallery.
2.share_plus
The share_plus package was used to share the generated portfolio image through the device's available sharing applications.
3.shared_preferences
The shared_preferences package was used to store the user's portfolio information locally. It stores information such as personal details, skills and contact information so that the data can remain available after closing and reopening the application.
4. Application Flow
The application follows this flow:
Splash Screen → Home → Portfolio Builder → About / Skills / Contact → Portfolio Preview
Splash Screen
The Splash Screen appears when the application starts and then moves to the Home screen.
Home Screen
The Home screen introduces the application and provides a Start Building button.
Portfolio Builder
The Portfolio Builder acts as the main step-by-step section of the application. It contains three sections:
1.	About
2.	Skills
3.	Contact
About
The user can enter:
•	Name
•	Profession
•	About information
•	Education
•	Experience
Skills
The user can add their professional or technical skills.
Contact
The user can enter contact information such as:
•	Email
•	Phone
•	Location
•	LinkedIn
•	GitHub
Portfolio Preview
After entering the required information, the user can view the final portfolio.
The information is displayed over a designed background image instead of a simple plain card layout.
The user can then:
•	Save the portfolio as an image.
•	Share the portfolio image.
5. Flutter & Dart Concepts Used
Flutter Widgets
StatelessWidget
StatefulWidget
BuildContext
Widget Tree
Row and Column
Container
Expanded
ListView
Text Fields
Buttons
Navigation
Classes and Objects
Lists
6. Problems Faced and Solutions
Problem 1: Sharing Data Between Screens
Initially, information entered on one screen needed to be available on other screens.
Solution
A separate PortfolioData class was created to store the portfolio information. The same data object was passed between the relevant screens.
Problem 2: Organizing the Project Files
As the number of screens increased, keeping all files organized became important.
Solution
The screen files were placed inside a dedicated screens folder, while portfolio_data.dart was kept directly inside the lib folder.
Problem 3: Background Image Asset
The portfolio background image initially caused an asset-related issue because the actual image file type was JFIF.
Solution
The image was renamed with the correct .jfif extension and the asset path was updated in pubspec.yaml.
Problem 4: Portfolio Image Saving
The final portfolio needed to be saved as an image rather than only being displayed on the screen.
Solution
RepaintBoundary was used to capture the portfolio widget as an image. The gal package was then used to save the image to the device Gallery.
Problem 5: Sharing the Portfolio
The portfolio image also needed to be shared with other applications.
Solution
The share_plus package was added to the project. The generated portfolio image is passed to the device's sharing system.
Problem 6: Input Validation
Users could enter invalid information in fields such as email and phone number.
Solution
Validation was added to the Contact section. The phone field was restricted to numeric input, and email validation was added to check the entered email format.
Problem 7: Providing Useful Skill Suggestions
Users may not always know which skills to enter or may want commonly used professional skills.
Solution
An autocomplete suggestion system was added to the Skills section. Professional and technical skills are suggested while the user types, while custom skills can still be entered manually.
Problem 8: Maintaining Data After Closing the App
Previously, information could be lost when the application was closed because the data was only maintained during the current application session.
Solution
The shared_preferences package was added for local data persistence. Portfolio information is saved locally and loaded again when the application starts.
Problem 9: Code Errors During Development
Some syntax and import errors appeared during development, including an issue related to RenderRepaintBoundary.
Solution
The required Flutter rendering import was added:
import 'package:flutter/rendering.dart';
The button structure and brackets were also checked and corrected when syntax errors appeared.
7. What I Learned
During Phase 2, I learned how to build a more complete Flutter application and connect multiple screens together.
I learned how to:
•	Organize a Flutter project into separate files and folders.
•	Create reusable classes for storing application data.
•	Pass data between screens.
•	Work with user input.
•	Validate email and phone number input.
•	Create professional autocomplete suggestions.
•	Manage lists of user-entered skills.
•	Prevent duplicate skills.
•	Store application data locally using shared_preferences.
•	Load previously saved information when the application starts.
•	Use async and await for local data operations.
•	Navigate between multiple screens.
•	Use assets in a Flutter project.
•	Configure assets through pubspec.yaml.
•	Capture a Flutter widget as an image.
•	Save an image to the device Gallery.
•	Share an image using the device's sharing system.
•	Identify and fix syntax, import and project configuration errors.
This project also improved my understanding of how different Flutter widgets work together to create a complete application.
