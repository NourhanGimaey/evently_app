class IntroDetails {
  final String imagePath;
  final String title;
  final String subtitle;

  const IntroDetails({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  static const List<IntroDetails> introDetails = [
    IntroDetails(
      imagePath: 'assets/images/intro1.png',
      title: 'Find Events That Inspire You',
      subtitle:
          "Dive into a world of events crafted to fit your unique interests!\nWhether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    IntroDetails(
      imagePath: 'assets/images/intro2.png',
      title: 'Effortless Event Planning',
      subtitle:
          "Take the hassle out of organizing events with our all-in-one planning tools!\nFrom setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    IntroDetails(
      imagePath: 'assets/images/intro3.png',
      title: 'Connect with Friends & Share Moments',
      subtitle:
          "Make every event memorable by sharing the experience with others!\nOur platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];
}
