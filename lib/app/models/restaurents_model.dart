
class Restaurants {
  final List<Restaurant>? restaurants;

  Restaurants({
    this.restaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    restaurants: json["restaurants"] == null ? [] : List<Restaurant>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": restaurants == null ? [] : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  final int? id;
  final String? name;
  final String? neighborhood;
  final String? photograph;
  final String? address;
  final Latlng? latlng;
  final String? cuisineType;
  final OperatingHours? operatingHours;
  final List<Review>? reviews;

  Restaurant({
    this.id,
    this.name,
    this.neighborhood,
    this.photograph,
    this.address,
    this.latlng,
    this.cuisineType,
    this.operatingHours,
    this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    neighborhood: json["neighborhood"],
    photograph: json["photograph"],
    address: json["address"],
    latlng: json["latlng"] == null ? null : Latlng.fromJson(json["latlng"]),
    cuisineType: json["cuisine_type"],
    operatingHours: json["operating_hours"] == null ? null : OperatingHours.fromJson(json["operating_hours"]),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "neighborhood": neighborhood,
    "photograph": photograph,
    "address": address,
    "latlng": latlng?.toJson(),
    "cuisine_type": cuisineType,
    "operating_hours": operatingHours?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Latlng {
  final double? lat;
  final double? lng;

  Latlng({
    this.lat,
    this.lng,
  });

  factory Latlng.fromJson(Map<String, dynamic> json) => Latlng(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class OperatingHours {
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;

  OperatingHours({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory OperatingHours.fromJson(Map<String, dynamic> json) => OperatingHours(
    monday: json["Monday"],
    tuesday: json["Tuesday"],
    wednesday: json["Wednesday"],
    thursday: json["Thursday"],
    friday: json["Friday"],
    saturday: json["Saturday"],
    sunday: json["Sunday"],
  );

  Map<String, dynamic> toJson() => {
    "Monday": monday,
    "Tuesday": tuesday,
    "Wednesday": wednesday,
    "Thursday": thursday,
    "Friday": friday,
    "Saturday": saturday,
    "Sunday": sunday,
  };
}

class Review {
  final String? name;
  final String? date;
  final int? rating;
  final String? comments;

  Review({
    this.name,
    this.date,
    this.rating,
    this.comments,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    name: json["name"],
    date: json["date"],
    rating: json["rating"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "rating": rating,
    "comments": comments,
  };
}
