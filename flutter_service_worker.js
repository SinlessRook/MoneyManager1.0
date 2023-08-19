'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/AUTO_MERGE": "2b65ad073598795406ef213c2cbcd60f",
".git/COMMIT_EDITMSG": "f3318349cad524de88a1325b0fc45172",
".git/config": "37a6175e54e3545419ec186c1c7fe7af",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "cd70e367be73bd84e7556d076c8497d7",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "f81c780f7c012237e145d9a5b31031a3",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "49f4976bf1941b2b8f4c3d66192865ef",
".git/logs/refs/heads/main": "9bdafcb37819d08ca0320184b60bd57f",
".git/logs/refs/remotes/origin/main": "71bba05a100fdf5c2eae592d8108b64d",
".git/MERGE_HEAD": "31bc46fc0415fd8cdc0caae6d17f4d8c",
".git/MERGE_MODE": "d41d8cd98f00b204e9800998ecf8427e",
".git/MERGE_MSG": "ef381ebda08cfec13b68fb53d5114054",
".git/objects/03/c531a7a4eadfbb97e5434401927ee31890cf33": "fe6b24f60048b7f218835d95c2c650ae",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/05/7d54514d10f9c08202cfca1b6842bbb60b91da": "4ba0cf0c25f44d7595714c4523c1c692",
".git/objects/0b/785827d7167115a910f18e173062272a2ae014": "24292b81870cbc6cda757298f5972425",
".git/objects/0b/85bcdb86bf9e9f9fda81b13cec9c9349d47d77": "77cbf4b6cc88e2471afd14a98ef2e0ed",
".git/objects/0c/faa17833995e57aa532634e694b12d6435df83": "124dd3db5838b14be8214fcc0864806d",
".git/objects/0f/115090c521d4a672f69a3fbd584682b2eb5b1d": "e916d98b5af79b47b6192afa70873732",
".git/objects/11/ab5218e6cdedb3b91334610edbf642bee7ea3f": "e1fe158ab25f20a6268c930cc1d65f94",
".git/objects/13/85328164c82a51e892ca481c90d87d0d5f1047": "329661d419b7f78a8ad6d9b51d875d36",
".git/objects/13/a48eb2599ccf5c7635994600a144f34d3a2c99": "59d776c3850d5ab9e97296ef49b98a7e",
".git/objects/1a/877cfab24d8908ecf99f328777b0d3537e2756": "2da9e5cfb4dd4110121fd17cc3205e9c",
".git/objects/1b/58eed2581a78a66467686e82d0f265dc4b4fb8": "d879c8cd5e4f92b4c84d9b7b4878a0ad",
".git/objects/1d/384f3748038966a5c7316223edf120dd5894dd": "a8d542276aa823dfefb8d26439e1077a",
".git/objects/1d/40d46b4c87b9954a1493b0c905b14048b50901": "65690a51226fd04ed3700db863cab9a1",
".git/objects/1e/bf993c04c08e17a0122730f8d7ce6e139c8bad": "eeb4f0d71f24758335fe1753273ad6c2",
".git/objects/1f/686edd1465272558af328ca43cb7189a0059e6": "5e83820f6d3e5392693d45bc239b2b61",
".git/objects/20/5c413c2bc575057b139c70972e333471e5bcdf": "cd1b7fb6cc90d2eb1c0e35ae9f57a8ed",
".git/objects/27/d13868df7f217010e1b34bcb469a644dda337f": "71f11a99d070e8b9059e3eb2a0d972e3",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/37/7580cbf691d03aea79c63a3a251b1b48ac01f1": "c196d282a50e3c372b4445c6b8868297",
".git/objects/3c/ec1adff6fff079ae8a613f21e3b9dd18503d42": "ece80ebab99495b04e519d6bbc065aef",
".git/objects/41/263fa52ff42ef868d761c6b088264f170f293e": "a6905e8a3bf9f3559d9853e80486f198",
".git/objects/41/e45083d6b533b978ccffbc592e3c9576b4b1e1": "e80e351d233943e63a2043898109007e",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/714fa67a134d3c6f313c8c39a3c754b2f7105c": "37e75e7361365ecb1adae8371201b1f3",
".git/objects/51/34e6402246228fb7f58ce8fe76727a61d99a62": "6b5e5b48febe40daec7062aecdc3b39f",
".git/objects/54/561f7e052095ab8edb0f81b29f07685ffc2f2d": "62792591d37ce2e818f5bc40cdc86f9f",
".git/objects/56/3285ab515f69ac08d3bd6bc3f0d9ea488e29f4": "0a6e916b24c1215a99a02e8f2b1054ec",
".git/objects/5a/283f3de1567e14d7db83c2dfb93789bec0b8c3": "f232a5e2a8c7f880c573ec822de385e8",
".git/objects/5a/fc705e77dfe5fff5fc6d95b853d830083f2d16": "2930724e9b41713818133c174ab76ae2",
".git/objects/62/a01d6826913d9efa140d2e9f4bc0f13918e607": "44ba2af6a4f05cb190463143170ae010",
".git/objects/66/f1a0c8836fac670f5838e533f4245b4e426486": "e902ee004b511bb36b1d6b705ef4bdce",
".git/objects/6a/6e51aa84407015ecd1ff851968d7412305fb9f": "8cd464aa436c71b73b2a12c54fa8047c",
".git/objects/6d/f0abd438f32c4d607b359545d8b19b487cd2e0": "cde88a3a6c4a0f9a8efac685b4e02c6d",
".git/objects/6e/668bedd325e4605f7d8d7717134b0917318e6a": "bb0f414223da695446a7080247a5a3d9",
".git/objects/70/010cc4761157d9d7cc2d082cf342e63fe1190a": "baf21d1dacab382149ee93266543ff40",
".git/objects/73/44c9ae2f2c850b5d307842f45bee6ac51d48dd": "5c3bfd48db38e185d7764185b0d2164b",
".git/objects/76/d9dcc49580da5294ee54eee65eb73eea02aa23": "ec69083c74ffdfce7e412cee7fe08829",
".git/objects/7c/06ae2df11109c81ccdbb8c933b81a75d85deb5": "4c7f9207eeb2b8e5e93ee95d27d26438",
".git/objects/7d/94ab33b5516eb50e100541f11935427df59fa0": "df14e87a02b2e4ff9e7dbc374234cfeb",
".git/objects/83/1ba0e53237af3ac03466316b5f4cac47e0ab18": "c59bca67afdbbc241ac8b1af00dc40a9",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/715c4fadf461d055d686de090c15bd625c9d1a": "78b4659678c7b9b6020056d3c6350470",
".git/objects/8a/85f417b60d825a7b58a39ddfb9839c3906bf90": "e2d522c8be2b531724550892965f8e9a",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/155896ea0401fcf1258c76579ff9414313ebe5": "d633b9530d776da19164eaf34cddbac7",
".git/objects/8e/7f4b338840099949781ab85496d7a67fae46f1": "7f2803c236e9e7d95ef6ed16a3a2bd13",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "e3695ae5742d7e56a9c696f82745288d",
".git/objects/95/64eafba1e6f6c338b7d3fd7ad00f27bf6e44fb": "b0299aa1f87ec8c545d07b7a546083b9",
".git/objects/98/b5a39c73805e18fb8596ee198c38869c9147cf": "15f41301da4591aff90033284eb4690b",
".git/objects/9c/d9c19085b052ab8c847bcf6b5453b631f6eccb": "94f32bef0d716ebfc82deb9c888643e9",
".git/objects/a4/0b8547f6ea903e3b45622cc65c9b08f9f9430a": "1c4307439266fa5c623ac90eec8a4544",
".git/objects/ac/0d3b14876f63dad49c5cd5c9d937978dc95741": "7b68455a44d54c03171992240e528c11",
".git/objects/ad/51eaaecb3a40208c83773fcc8b441333f7ef79": "60e47b4ddb527e0f126ecbf19dfa3f43",
".git/objects/ae/37803d1933c3979fd1b939ff61cc667b0b70dc": "f5c08c98e82ebd9034dbd78b64a292fa",
".git/objects/ae/7538fd53f9cfbaf1527d31c9b4333d532cfc67": "e2340f2ab87fbd2da91b823566149120",
".git/objects/af/ebadcec7e1c0c946cd6c67557b11eb4bb526f1": "7264657c0dd4a46c5b8b014582abe558",
".git/objects/b2/2fdb2d1fa6a3bced274617d58f6ab432bb0d8b": "1b405e4dfab487f51d41422d52600614",
".git/objects/b2/e94f2983b60c5c2deb7b54eea9fa61a25f0755": "365451dc8cea7766e4993d4f21bdb5de",
".git/objects/b5/80112f42439469aee1e7cb99df2ad9459750f0": "13f046e8efa8aac6b2f238d5243c4f19",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/9e56bf74613b8d71e8f3fa6056713cbe0fde82": "930246ebf79d371771142e68fd51a7f9",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/8287438769a2cc84f390984691ecfc69c2bd05": "55c2a0402330798ea522f102f70eda81",
".git/objects/bb/0ebdb3460c8df791df693a5d311e453208186a": "40777f6fb8a45b6a74830f1c85e80297",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/be/998ccd794060f6180169544da699c8f71794ff": "301569eeeb134f315ccac0af6ed5b312",
".git/objects/c2/df599600a4e85360387a186236d35002512b8a": "9181f8ace6a10c9cb7a67d61ceb61b61",
".git/objects/c3/865a0f1907f8f59389c0e7683414e9b2fe8a6b": "552aa091c38340f28627b9578cbb4395",
".git/objects/c4/ffec8ad10ea6ddedc8be43c2a7604b85d9afdf": "2ac228b0591c9579f197d2659fa9c0be",
".git/objects/c6/22b259ac0442814a92a805ebcf608741d90bc9": "116f535108a99ffa3e42c165e3df9bb3",
".git/objects/c8/6b67048d048d3d1351013cb2f7bafb18d50aac": "e2d3ff5addd2091733ee05fa3647ac67",
".git/objects/c9/cf7214e8a9b88b04b09611e5d7a9f0799dc229": "ead0b5cd1044dcf76733118e5f5ddb2f",
".git/objects/ca/795b78d49c1e0f8a194d2cc31092a5f3e210e3": "9e163b22ef5945464a5537a9cdf9f8ab",
".git/objects/cc/5721a9d707d0d230a468fb5b144e164928266c": "60585dd7b08c8421b98e07d262250dc7",
".git/objects/d2/01097ba11bd180239049871487e65e6bcf73a8": "6ebf9608335874e4cbdba293894e241f",
".git/objects/d2/f9bc0c625f75c2df8cda7e55b4a834cbaabc4b": "bf0b8602fc59209854af03555fe709b5",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/d4/38857702e987c6c8eb761e53a6aaf7aea3b892": "a5e9d88c53579cbf4fa4f41694e67121",
".git/objects/d5/3c9edeff71134221f3c9f7039dc18f3e76571d": "deb679d563aa4e5778a2ed010deeb3f2",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/6d0c4ebb827f118b41ee00b6fdc6421bc26523": "b8b2541b866925eadd4f2b0a487c806e",
".git/objects/de/866e632e3703f3f6606e098186b3fc8cfd7950": "36dd5eaa124fdb54774b9f72cf50701d",
".git/objects/e7/5e920f175da53dd6f04d858636baa25dc702f4": "0fd694d0b7477cee41611e70d0cd6732",
".git/objects/e8/1c4c303d8735c18784f19a6385226d7633aef0": "d18081f50544238939f3cf775366c2db",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f0/6bdae9f113914fc87581be004fa7d4c588b62b": "257143fc15ba1aa4d9d2472f84082a7a",
".git/objects/f1/2a7d77a0ad5d82733b4f643c6ab93f988c0a33": "51b27b428973d96f292faf1a83d36a61",
".git/objects/f1/5496128e2fbfd78d80afa29f49ed822f7fb57a": "3b070e510446d596279f503ed52c29ad",
".git/objects/f1/590f7e34e07109b01a8f75fc1e35419e65946b": "e4a68db2f79434303484522910701327",
".git/objects/f9/4da2bf2d853c4f00db86c36f11e4944881bc04": "c258e37eb19df7a2e498f94365957b06",
".git/objects/ff/6cf6f58b7ef8d8b66427d002a5d9dd5c827212": "b08838a96b5c0fb65bec54f339260aa4",
".git/objects/ff/ee700c6d357362e351c55d4fcc5cae41398733": "aeee91916ab62743718f65fc1732a2ee",
".git/ORIG_HEAD": "c132b515f62e9f198bf1c7beb92276fc",
".git/refs/heads/main": "c132b515f62e9f198bf1c7beb92276fc",
".git/refs/remotes/origin/main": "31bc46fc0415fd8cdc0caae6d17f4d8c",
"assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2ae11884845b94e004be757588c490f4",
"assets/NOTICES": "023146c27169cc288f1726cc218567da",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "80ec9c8112d90cae224d60907e22523a",
"/": "80ec9c8112d90cae224d60907e22523a",
"main.dart.js": "36b81ab6359595454bcee9686ced9715",
"manifest.json": "e3d40771ec797a21ac08e2bc4f885b96",
"README.md": "6ccced0a0d0b91b820db9385049eb941",
"version.json": "a248072ba3eae8e243b9d0ff107dc4a9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
