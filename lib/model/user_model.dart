class UserModel {
  final String name, urlImage, location, bio;
  final int countFollowers, countFollowing, countPosts;
  final List<String> urlPhotos;
   bool isFollow;

  UserModel(
      {required this.name,
      required this.urlImage,
      required this.location,
      required this.bio,
      required this.countFollowers,
      required this.countFollowing,
      required this.countPosts,
      required this.isFollow,
      required this.urlPhotos});
}

final List<UserModel> users = [
  UserModel(
    name: 'Bill Gates',
    urlImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Bill_Gates_2017_%28cropped%29.jpg/330px-Bill_Gates_2017_%28cropped%29.jpg',
    location: 'United States',
    bio:
        'William Henry Gates III (born October 28, 1955) is an American business magnate, software developer, investor, author, and philanthropist. He is a co-founder of Microsoft, along with his late childhood friend Paul Allen',
    countFollowers: 1400,
    countFollowing: 100,
    countPosts: 35,
    isFollow: true,
    urlPhotos: [
      'https://cdn.prod.www.spiegel.de/images/cf32e15a-c5a8-4665-94d7-b56d6ff8db55_w1200_r1.33_fpx54_fpy36.jpg',
      'https://images.english.elpais.com/resizer/3cRedL3IoZYHhNMrgPnPZpj5jEM=/1960x1470/filters:focal(573x147:583x157)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/D3EAIL5PFZRCGRANXCC5IBMADY.jpg'
    ],
  ),
  UserModel(
    name: 'Steve Jobs',
    urlImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Steve_Jobs_Headshot_2010-CROP_%28cropped_2%29.jpg/330px-Steve_Jobs_Headshot_2010-CROP_%28cropped_2%29.jpg',
    location: 'United States',
    bio:
        'Steven Paul Jobs (February 24, 1955 – October 5, 2011) was an American entrepreneur, industrial designer, business magnate, media proprietor, and investor. He was the co-founder, chairman, and CEO of Apple;',
    countFollowers: 1800,
    countFollowing: 510,
    countPosts: 118,
    isFollow: false,
    urlPhotos: [
      'https://www.biography.com/.image/ar_1:1,c_fill,cs_srgb,fl_progressive,q_auto:good,w_1200/MTY2MzU3OTcxMTUwODQxNTM1/steve-jobs--david-paul-morrisbloomberg-via-getty-images.jpg',
    ],
  ),
];
