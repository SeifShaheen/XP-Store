class Game {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final String category;
  final double rating;
  final bool isFeatured;
  final bool isOnSale;

  Game({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    this.isFeatured = false,
    this.isOnSale = false,
  });

  // Sample gaming data
  static List<Game> getFeaturedGames() {
    return [
      Game(
        id: '1',
        title: 'Cyberpunk 2077',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co2rpf.jpg',
        price: 59.99,
        description: 'An open-world, action-adventure story set in Night City',
        category: 'RPG',
        rating: 4.2,
        isFeatured: true,
      ),
      Game(
        id: '2',
        title: 'Elden Ring',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co2tgi.jpg',
        price: 69.99,
        description: 'A new fantasy action RPG adventure',
        category: 'RPG',
        rating: 4.8,
        isFeatured: true,
      ),
      Game(
        id: '3',
        title: 'Call of Duty: Modern Warfare III',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co6w2a.jpg',
        price: 79.99,
        description: 'The ultimate multiplayer experience',
        category: 'FPS',
        rating: 4.1,
        isFeatured: true,
      ),
    ];
  }

  static List<Game> getAllGames() {
    return [
      ...getFeaturedGames(),
      Game(
        id: '4',
        title: 'The Witcher 3: Wild Hunt',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co1wyy.jpg',
        price: 29.99,
        description: 'A story-driven open world RPG',
        category: 'RPG',
        rating: 4.9,
        isOnSale: true,
      ),
      Game(
        id: '5',
        title: 'Grand Theft Auto V',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co1rgi.jpg',
        price: 19.99,
        description: 'Experience the ultimate open-world adventure',
        category: 'Action',
        rating: 4.5,
        isOnSale: true,
      ),
      Game(
        id: '6',
        title: 'Minecraft',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co49x5.jpg',
        price: 26.95,
        description: 'Build, explore, and survive in infinite worlds',
        category: 'Sandbox',
        rating: 4.7,
      ),
      Game(
        id: '7',
        title: 'FIFA 24',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co6w1y.jpg',
        price: 69.99,
        description: 'The world\'s game is back with EA SPORTS FC 24',
        category: 'Sports',
        rating: 4.0,
      ),
      Game(
        id: '8',
        title: 'Assassin\'s Creed Valhalla',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co2rpg.jpg',
        price: 49.99,
        description: 'Become a legendary Viking warrior',
        category: 'Action',
        rating: 4.3,
      ),
    ];
  }

  static List<Game> getHotOffers() {
    return [
      Game(
        id: '9',
        title: 'Steam Summer Sale',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co1wyy.jpg',
        price: 0,
        description: 'Up to 90% off on thousands of games!',
        category: 'Sale',
        rating: 0,
      ),
      Game(
        id: '10',
        title: 'Epic Games Free Week',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co2rpf.jpg',
        price: 0,
        description: 'Free games every week on Epic Games Store',
        category: 'Free',
        rating: 0,
      ),
      Game(
        id: '11',
        title: 'PlayStation Plus Collection',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co2tgi.jpg',
        price: 0,
        description: 'Access to 20+ critically acclaimed games',
        category: 'Collection',
        rating: 0,
      ),
      Game(
        id: '12',
        title: 'Xbox Game Pass Ultimate',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co6w2a.jpg',
        price: 0,
        description: 'Play hundreds of games for one low price',
        category: 'Subscription',
        rating: 0,
      ),
      Game(
        id: '13',
        title: 'Nintendo Switch Online',
        imageUrl:
            'https://images.igdb.com/igdb/image/upload/t_cover_big/co49x5.jpg',
        price: 0,
        description: 'Classic NES and SNES games included',
        category: 'Retro',
        rating: 0,
      ),
    ];
  }
}
