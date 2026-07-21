String getDailyPrompt(List<String>? primaryGoals, String partnerName,
    DateTime? relationshipStartDate) {
  final Map<String, List<String>> promptLibrary = {
    'Deeper communication': [
      'What is one thing $partnerName did this week that made you feel truly seen?',
      'What is a quality in $partnerName that you wish you had more of yourself?',
      'What’s a secret dream you haven’t shared with $partnerName yet?',
      'What is your favorite way to spend a quiet evening with $partnerName?',
      'What is a topic you’d like to talk more about with $partnerName?',
      'How has your definition of "love" changed since being with $partnerName?',
      'What is one thing $partnerName could do to support you better during a long day?',
      'If you could ask $partnerName anything and they had to answer honestly, what would it be?',
      'What was the moment you first felt a deep connection with $partnerName?',
      'What is a song that perfectly describes your relationship with $partnerName?'
    ],
    'Date nights': [
      'If you and $partnerName could go on a dream date tonight with no budget, where would you go?',
      'What is your favorite memory of a date you had with $partnerName early on?',
      'What is a new place in town you’ve been wanting to explore with $partnerName?',
      'If you could plan a surprise date for $partnerName, what would it be?',
      'What was the best date you and $partnerName ever went on?',
      'What’s an activity $partnerName loves that you’d be willing to try for a date?',
      'If you had to recreate your very first date with $partnerName, what would you change?',
      'What is the most romantic "stay-at-home" date idea you have for $partnerName?',
      'What is your favorite outfit that $partnerName wears on a date night?',
      'Describe a perfect weekend getaway with $partnerName.'
    ],
    'Conflict resolution': [
      'What is something $partnerName does that helps you feel calm during a disagreement?',
      'What is one way $partnerName shows they care even when you are both busy?',
      'What is the most helpful thing $partnerName can say when you are feeling stressed?',
      'How has your relationship grown through a challenge you faced together?',
      'What is a "small win" you and $partnerName had in communication recently?',
      'What is your "love language" during a disagreement, and how can $partnerName speak it?',
      'What is one thing you appreciate about how $partnerName handles stress?',
      'How can you and $partnerName make more time for "us" when life gets overwhelming?',
      'What is a boundary that has made your relationship with $partnerName stronger?',
      'What is one thing you’ve learned about $partnerName from a past misunderstanding?'
    ],
    'Shared goals': [
      'What is one goal you are most excited to achieve with $partnerName this year?',
      'What does your "perfect life" look like 5 years from now with $partnerName?',
      'What is a project or hobby you’d like to start with $partnerName?',
      'What is one value that you think is most important to your shared future?',
      'What is a place you want to travel to with $partnerName in the next year?',
      'How can you and $partnerName better support each other’s individual dreams?',
      'What is a financial goal you’d love to reach together with $partnerName?',
      'What "legacy" do you want to build as a couple with $partnerName?',
      'What is a skill you want to learn together with $partnerName?',
      'What is the most exciting thing about your future with $partnerName?'
    ],
  };

  final List<String> defaultPrompts = [
    'What is one thing you appreciate about $partnerName today?',
    'If you could relive one day with $partnerName, which one would it be?',
    'What is a small detail about $partnerName that always makes you smile?',
    'What song always reminds you of $partnerName and why?',
    'What is one way $partnerName has made your life better recently?',
    'What is your favorite tradition you share with $partnerName?',
    'How does $partnerName inspire you to be a better person?',
    'What is the kindest thing $partnerName has said to you recently?',
    'What is one physical trait of $partnerName that you adore?',
    'If you had to describe $partnerName in only three words, what would they be?'
  ];

  List<String> availablePrompts = [];
  if (primaryGoals != null && primaryGoals.isNotEmpty) {
    for (var goal in primaryGoals) {
      if (promptLibrary.containsKey(goal)) {
        availablePrompts.addAll(promptLibrary[goal]!);
      }
    }
  }

  if (availablePrompts.isEmpty) {
    availablePrompts = defaultPrompts;
  }

  // JOURNEY-BASED SEEDING: Unique to every couple
  int index;
  if (relationshipStartDate != null) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = DateTime(relationshipStartDate.year, relationshipStartDate.month,
        relationshipStartDate.day);
    final daysSinceStart = today.difference(start).inDays;
    index = (daysSinceStart < 0 ? 0 : daysSinceStart) % availablePrompts.length;
  } else {
    final now = DateTime.now();
    final daySeed = now.year * 366 + now.month * 31 + now.day;
    index = daySeed % availablePrompts.length;
  }

  return availablePrompts[index];
}
