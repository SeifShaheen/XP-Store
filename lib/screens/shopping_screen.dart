import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xp_store/models/game.dart';
import 'package:xp_store/l10n/app_localizations.dart';
import 'package:xp_store/providers/language_provider.dart';
import 'package:xp_store/screens/welcome_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Game> _cart = [];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart(Game game) {
    final l10n = AppLocalizations.of(context);

    setState(() {
      _cart.add(game);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${game.title} ${l10n.itemAddedToCart}'),
        backgroundColor: const Color(0xFF00FF88),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            l10n.changeLanguage,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF88),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇺🇸', style: TextStyle(fontSize: 24)),
                title: const Text(
                  'English',
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _changeLanguage(context, const Locale('en'));
                },
              ),
              ListTile(
                leading: const Text('🇸🇦', style: TextStyle(fontSize: 24)),
                title: const Text(
                  'العربية',
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _changeLanguage(context, const Locale('ar'));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    languageProvider.changeLanguage(locale);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Language changed to ${locale.languageCode == 'ar' ? 'Arabic' : 'English'}',
        ),
        backgroundColor: const Color(0xFF00FF88),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            l10n.signOut,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF88),
            ),
          ),
          content: Text(
            l10n.areYouSureSignOut,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              color: Colors.white70,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  color: Colors.white70,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _signOut(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FF88),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                l10n.signOut,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Clear cart
    setState(() {
      _cart.clear();
    });

    // Navigate back to welcome screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.successfullySignedOut),
        backgroundColor: const Color(0xFF00FF88),
      ),
    );
  }

  Widget _buildFeaturedGameCard(Game game) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF00FF88).withOpacity(0.8),
                    const Color(0xFF00CC6A).withOpacity(0.6),
                  ],
                ),
              ),
              child: const Icon(
                Icons.sports_esports,
                size: 80,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${game.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 14,
                        color: Color(0xFF00FF88),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(Game game) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Game Image
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00FF88).withOpacity(0.3),
                  const Color(0xFF00CC6A).withOpacity(0.2),
                ],
              ),
            ),
            child: const Icon(
              Icons.sports_esports,
              size: 50,
              color: Color(0xFF00FF88),
            ),
          ),

          // Game Info
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  game.category,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${game.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 14,
                        color: Color(0xFF00FF88),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _addToCart(game),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00FF88),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotOfferItem(Game offer) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF00FF88).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Offer Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Color(0xFF00FF88), Color(0xFF00CC6A)],
              ),
            ),
            child: const Icon(Icons.local_offer, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),

          // Offer Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  offer.description,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Action Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF88),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              l10n.view,
              style: const TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final featuredGames = Game.getFeaturedGames();
    final allGames = Game.getAllGames();
    final hotOffers = Game.getHotOffers();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: Text(
          l10n.ourGames,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        actions: [
          // Shopping Cart
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.cartItems(_cart.length)),
                      backgroundColor: const Color(0xFF00FF88),
                    ),
                  );
                },
              ),
              if (_cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00FF88),
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${_cart.length}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          // Menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: const Color(0xFF1A1A1A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (String value) {
              switch (value) {
                case 'language':
                  _showLanguageDialog(context);
                  break;
                case 'signout':
                  _showSignOutDialog(context);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'language',
                child: Row(
                  children: [
                    const Icon(Icons.language, color: Color(0xFF00FF88)),
                    const SizedBox(width: 12),
                    Text(
                      l10n.changeLanguage,
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'signout',
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: Colors.red),
                    const SizedBox(width: 12),
                    Text(
                      l10n.signOut,
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1A1A), Color(0xFF0A0A0A)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Games Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  l10n.featuredGames,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FF88),
                  ),
                ),
              ),

              // Featured Games PageView
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: featuredGames.length,
                  itemBuilder: (context, index) {
                    return _buildFeaturedGameCard(featuredGames[index]);
                  },
                ),
              ),

              // Page Indicator
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  featuredGames.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? const Color(0xFF00FF88)
                          : Colors.white30,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // All Games Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  l10n.allGames,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FF88),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Games Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: allGames.length,
                itemBuilder: (context, index) {
                  return _buildGameCard(allGames[index]);
                },
              ),

              const SizedBox(height: 20),

              // Hot Offers Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  l10n.hotOffers,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FF88),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Hot Offers List
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: hotOffers.length,
                  itemBuilder: (context, index) {
                    return _buildHotOfferItem(hotOffers[index]);
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
