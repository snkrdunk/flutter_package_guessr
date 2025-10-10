/// パッケージのサンプルデータ
/// 実際のプロジェクトでは、これらのデータをFirestoreやAPIから取得します
class PackagesData {
  static final List<Map<String, dynamic>> samplePackages = [
    {
      'name': 'riverpod',
      'publisher': 'dash-overflow.net',
      'description': 'A reactive caching and data-binding framework',
      'version': '2.5.0',
      'likes': 3500,
      'pubPoints': 140,
      'popularity': 98,
      'platforms': ['Flutter', 'Dart'],
      'tags': ['state-management', 'provider'],
      'logoUrl': null,
      'snippets': [
        '''
@riverpod
class Counter extends _\$Counter {
  @override
  int build() => 0;

  void increment() => state++;
}
''',
        '''
final counterProvider = StateProvider<int>((ref) => 0);

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('\$count');
  }
}
''',
        '''
ref.listen<int>(counterProvider, (previous, next) {
  print('Counter changed from \$previous to \$next');
});
''',
      ],
      'updatedAt': '2024-01-15T10:00:00.000Z',
    },
    {
      'name': 'go_router',
      'publisher': 'flutter.dev',
      'description': 'A declarative router for Flutter based on Navigation 2',
      'version': '14.0.0',
      'likes': 2800,
      'pubPoints': 140,
      'popularity': 95,
      'platforms': ['Flutter'],
      'tags': ['navigation', 'routing'],
      'logoUrl': null,
      'snippets': [
        '''
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetailsScreen(id: id);
      },
    ),
  ],
);
''',
        '''
context.go('/details/123');
context.push('/settings');
context.pop();
''',
        '''
@override
Widget build(BuildContext context) {
  return MaterialApp.router(
    routerConfig: router,
  );
}
''',
      ],
      'updatedAt': '2024-01-10T10:00:00.000Z',
    },
    {
      'name': 'freezed',
      'publisher': 'dash-overflow.net',
      'description': 'Code generation for immutable classes',
      'version': '2.4.0',
      'likes': 2500,
      'pubPoints': 140,
      'popularity': 92,
      'platforms': ['Flutter', 'Dart'],
      'tags': ['codegen', 'immutable'],
      'logoUrl': null,
      'snippets': [
        '''
@freezed
class Person with _\$Person {
  const factory Person({
    required String name,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json)
    => _\$PersonFromJson(json);
}
''',
        '''
final person = Person(name: 'John', age: 30);
final updated = person.copyWith(age: 31);
''',
        '''
@freezed
sealed class Result<T> with _\$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.error(String message) = Error<T>;
}
''',
      ],
      'updatedAt': '2024-01-12T10:00:00.000Z',
    },
    {
      'name': 'dio',
      'publisher': 'cfug.dev',
      'description': 'A powerful HTTP client for Dart',
      'version': '5.4.0',
      'likes': 3200,
      'pubPoints': 140,
      'popularity': 96,
      'platforms': ['Flutter', 'Dart'],
      'tags': ['http', 'network'],
      'logoUrl': null,
      'snippets': [
        '''
final dio = Dio();
final response = await dio.get('https://api.example.com/users');
print(response.data);
''',
        '''
dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['Authorization'] = 'Bearer \$token';
      return handler.next(options);
    },
  ),
);
''',
        '''
try {
  await dio.post('/login', data: {'email': email, 'password': password});
} on DioException catch (e) {
  if (e.response?.statusCode == 401) {
    print('Unauthorized');
  }
}
''',
      ],
      'updatedAt': '2024-01-08T10:00:00.000Z',
    },
    {
      'name': 'flutter_bloc',
      'publisher': 'bloclibrary.dev',
      'description': 'State management library using the BLoC pattern',
      'version': '8.1.0',
      'likes': 2900,
      'pubPoints': 140,
      'popularity': 94,
      'platforms': ['Flutter'],
      'tags': ['state-management', 'bloc'],
      'logoUrl': null,
      'snippets': [
        '''
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}
''',
        '''
BlocProvider(
  create: (context) => CounterBloc(),
  child: BlocBuilder<CounterBloc, int>(
    builder: (context, count) {
      return Text('\$count');
    },
  ),
);
''',
        '''
context.read<CounterBloc>().add(Increment());
''',
      ],
      'updatedAt': '2024-01-14T10:00:00.000Z',
    },
    {
      'name': 'shared_preferences',
      'publisher': 'flutter.dev',
      'description': 'Platform-independent persistent storage',
      'version': '2.2.0',
      'likes': 2600,
      'pubPoints': 130,
      'popularity': 93,
      'platforms': ['Flutter'],
      'tags': ['storage', 'preferences'],
      'logoUrl': null,
      'snippets': [
        '''
final prefs = await SharedPreferences.getInstance();
await prefs.setString('username', 'John');
final username = prefs.getString('username');
''',
        '''
await prefs.setInt('counter', 10);
await prefs.setBool('isLoggedIn', true);
await prefs.setStringList('items', ['a', 'b', 'c']);
''',
        '''
final keys = prefs.getKeys();
await prefs.remove('username');
await prefs.clear();
''',
      ],
      'updatedAt': '2024-01-05T10:00:00.000Z',
    },
  ];
}
