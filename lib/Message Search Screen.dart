import 'package:flutter/material.dart';

class MessageSearchScreen extends StatelessWidget {
  const MessageSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: const Color(0xFF00BF6D),
        foregroundColor: Colors.white,
        title: const Text("Chats"),
      ),
      body: Column(
        children: [
          // Appbar search
          Container(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              0,
              16.0,
              16.0,
            ),
            color: const Color(0xFF00BF6D),
            child: Form(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  // search
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF1D1D35).withOpacity(0.64),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: const Color(0xFF1D1D35).withOpacity(0.64),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  RecentSearchContacts(),
                  SizedBox(height: 16.0),
                  // you can show suggested style for search result
                  SuggestedContacts()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestedContacts extends StatelessWidget {
  const SuggestedContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Suggested",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .color!
                      .withOpacity(0.32),
                ),
          ),
        ),
        const SizedBox(height: 16.0),
        ...List.generate(
          demoContactsImage.length,
          (index) => ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 16.0 / 2),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(demoContactsImage[index]),
            ),
            title: const Text("Jenny Wilson"),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class RecentSearchContacts extends StatelessWidget {
  const RecentSearchContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent search",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .color!
                      .withOpacity(0.32),
                ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: Stack(
              children: [
                ...List.generate(
                  demoContactsImage.length + 1,
                  (index) => Positioned(
                    left: index * 48,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        shape: BoxShape.circle,
                      ),
                      child: index < demoContactsImage.length
                          ? CircleAvatar(
                              radius: 26,
                              backgroundImage:
                                  NetworkImage(demoContactsImage[index]),
                            )
                          : const RoundedCounter(total: 35),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RoundedCounter extends StatelessWidget {
  final int total;

  const RoundedCounter({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF2E2F45)
            : const Color(0xFFEBFAF3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$total+",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

final List<String> demoContactsImage = [
  'https://i.postimg.cc/g25VYN7X/user-1.png',
  'https://i.postimg.cc/cCsYDjvj/user-2.png',
  'https://i.postimg.cc/sXC5W1s3/user-3.png',
  'https://i.postimg.cc/4dvVQZxV/user-4.png',
  'https://i.postimg.cc/FzDSwZcK/user-5.png',
];
