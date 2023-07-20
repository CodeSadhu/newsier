# Newsier - News, Made Easier

Welcome to Newsier, your one-stop destination for the latest news from all around the world! 🌍 Stay informed, stay updated, and stay ahead with the power of Newsier. This delightful Flutter app fetches the freshest news data from newsapi.org and presents it in a user-friendly and captivating manner, making your news-reading experience easier and more enjoyable.

![Newsier Banner](assets/images/newsier.png)

## Features

- Get the latest news headlines from various sources and categories.
- Browse through detailed articles to read the full story.
- Responsive design for seamless access on both web and mobile devices.
- Aesthetic user interface to enhance your news exploration.

## How to Use

To start exploring the world of Newsier, follow these simple steps:

1. **Clone the Repository:**

   ```
   git clone https://github.com/CodeSadhu/newsier.git
   cd newsier
   ```

2. **Create Your API Key:**

   To fetch news data from newsapi.org, you'll need to obtain an API key. Don't worry; it's super easy!

   - Visit [newsapi.org](https://newsapi.org/) and sign up for an account.
   - Once you have your API key, create a file named `keys.txt` inside the `lib/` folder.
   - Paste your API key in `keys.txt`. This step is crucial for the app to function correctly.

3. **Flutter Packages Installation:**

   Ensure you have Flutter installed on your system. Then, navigate to the project root and execute:

   ```
   flutter pub get
   ```

4. **Run the App:**

   - For running the app on a mobile device, connect your device or use an emulator, then run:

     ```
     flutter run
     ```

   - For running the app on the web, use the following command:

     ```
     flutter run -d chrome
     ```

5. **Explore and Enjoy:**

   Congratulations! You're now ready to immerse yourself in the world of Newsier. Discover the latest news from various sources and delve into exciting articles on your favorite topics.

## Folder Structure

Here's an overview of Newsier's folder structure:

- `models/`: Contains model classes for news and article objects.
- `providers/`: Manages the API calls and state for news data.
- `screens/web/`: Web-responsive screens.
- `screens/mobile/`: Mobile-responsive screens.
- `utils/`: Home to all utilities like colors, common strings, responsive wrappers, and more.

## Credits

A huge thanks to [newsapi.org](https://newsapi.org/) for providing the outstanding news data service, enabling us to build Newsier with utmost reliability.
