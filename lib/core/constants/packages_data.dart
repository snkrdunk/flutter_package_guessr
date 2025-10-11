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
class ProviderElementBase<State> {
  final Set<ProviderSubscription> _dependencies = {};

  void _trackDependency(ProviderSubscription dependency) {
    _dependencies.add(dependency);
  }

  void _clearDependencies() {
    for (final dependency in _dependencies) {
      dependency.close();
    }
    _dependencies.clear();
  }
}
''',
        '''
mixin AutoDisposeProviderMixin<State> {
  bool _shouldAutoDispose = true;

  void markAsManuallyDisposed() {
    _shouldAutoDispose = false;
  }

  void autoDispose() {
    if (_shouldAutoDispose) {
      dispose();
    }
  }
}
''',
        '''
class Provider<T> {
  final Create<T> _create;

  T create(ProviderRef ref) {
    final state = _create(ref);
    ref.onDispose(() {
      // Cleanup logic
    });
    return state;
  }
}
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
GoRouter.routingConfig({
  required ValueListenable<RoutingConfig> routingConfig,
}) {
  configuration = RouteConfiguration(
    routingConfig,
    navigatorKey: navigatorKey,
    extraCodec: extraCodec,
  );

  routeInformationParser = GoRouteInformationParser(
    onParserException: parserExceptionHandler,
    configuration: configuration,
  );
}
''',
        '''
String namedLocation(
  String name, {
  Map<String, String> pathParameters = const <String, String>{},
  Map<String, dynamic> queryParameters = const <String, dynamic>{},
}) => configuration.namedLocation(
  name,
  pathParameters: pathParameters,
  queryParameters: queryParameters,
);
''',
        '''
void go(String location, {Object? extra}) {
  log('going to \$location');
  routeInformationProvider.go(location, extra: extra);
}

Future<T?> push<T>(String location, {Object? extra}) async {
  return routeInformationProvider.push<T>(
    location,
    base: routerDelegate.currentConfiguration,
    extra: extra,
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
final commonCopyWith = data.options.copyWith
  ? CopyWith(
      parents: data.parents,
      clonedClassName: data.name,
      readableProperties: data.properties.readableProperties,
      cloneableProperties: data.properties.cloneableProperties,
      genericsDefinition: data.genericsDefinitionTemplate,
      genericsParameter: data.genericsParameterTemplate,
      data: data,
    )
  : null;
''',
        '''
yield patterns(data);

for (final constructor in data.constructors) {
  yield Concrete(
    data: data,
    constructor: constructor,
    commonProperties: data.properties.readableProperties,
    globalData: globalData,
    copyWith: constructor.parameters.isNotEmpty ? CopyWith(...) : null,
  );
}
''',
        '''
Iterable<Object> _generateForData(Library globalData, Class data) sync* {
  if (data.options.fromJson) {
    yield FromJson(data);
  }

  if (data.options.toJson) {
    yield ToJson(data);
  }
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
Future<dynamic> future = Future<dynamic>(
  () => InterceptorState(requestOptions),
);

for (final interceptor in interceptors) {
  final fun = interceptor is QueuedInterceptor
    ? interceptor._handleRequest
    : interceptor.onRequest;
  future = future.then(requestInterceptorWrapper(fun));
}
''',
        '''
Future<Stream<Uint8List>?> _transformData(RequestOptions options) async {
  if (data is FormData) {
    options.headers[Headers.contentTypeHeader] =
      '\${Headers.multipartFormDataContentType}; boundary=\${data.boundary}';
    stream = data.finalize();
  } else {
    final transformed = await transformer.transformRequest(options);
    bytes = utf8.encode(transformed);
  }
  return addProgress(stream, length, options);
}
''',
        '''
FutureOr<dynamic> errorInterceptorWrapper(InterceptorErrorCallback cb) {
  return (dynamic error) {
    final state = error is InterceptorState
      ? error
      : InterceptorState(assureDioException(error, requestOptions));

    if (state.type == InterceptorResultType.next) {
      return listenCancelForAsyncTask(
        requestOptions.cancelToken,
        Future(handleError),
      );
    }
    throw error;
  };
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
return BlocListener<B, S>(
  bloc: _bloc,
  listenWhen: widget.buildWhen,
  listener: (context, state) => setState(() => _state = state),
  child: widget.build(context, _state)
);
''',
        '''
typedef BlocBuilderCondition<S> = bool Function(S previous, S current);

BlocBuilder<BlocA, BlocAState>(
  buildWhen: (previous, current) {
    // return true/false to determine rebuild
  },
  builder: (context, state) {
    // return widget based on state
  }
)
''',
        '''
@override
void initState() {
  super.initState();
  _bloc = widget.bloc ?? context.read<B>();
  _state = _bloc.state;
}

@override
void didUpdateWidget(BlocBuilderBase<B, S> oldWidget) {
  super.didUpdateWidget(oldWidget);
  final currentBloc = widget.bloc ?? _bloc;
  if (oldWidget.bloc != currentBloc) {
    _bloc = currentBloc;
    _state = _bloc.state;
  }
}
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
static Future<Map<String, Object>> _getSharedPreferencesMap() async {
  if (_prefixHasBeenChanged) {
    return await _store.getAllWithParameters(
      GetAllParameters(
        filter: PreferencesFilter(prefix: _prefix, allowList: _allowList)
      )
    );
  } else {
    return await _store.getAll();
  }
}
''',
        '''
Future<void> reload() async {
  final Map<String, Object> preferences =
    await SharedPreferences._getSharedPreferencesMap();
  _preferenceCache.clear();
  _preferenceCache.addAll(preferences);
}
''',
        '''
Future<bool> _setValue(String valueType, String key, Object value) {
  final String prefixedKey = '\$_prefix\$key';
  if (value is List<String>) {
    _preferenceCache[key] = value.toList();
  } else {
    _preferenceCache[key] = value;
  }
  return _store.setValue(valueType, prefixedKey, value);
}
''',
      ],
      'updatedAt': '2024-01-05T10:00:00.000Z',
    },
    {
      'name': 'provider',
      'publisher': 'dash-overflow.net',
      'description': 'A wrapper around InheritedWidget to make them easier to use and more reusable',
      'version': '6.1.5',
      'likes': 10800,
      'pubPoints': 150,
      'popularity': 100,
      'platforms': ['Flutter', 'Dart'],
      'tags': ['state-management', 'inherited-widget'],
      'logoUrl': null,
      'snippets': [
        '''
static T of<T>(BuildContext context, {bool listen = true}) {
  assert(context.owner!.debugBuilding || listen == false);

  final inheritedElement = _inheritedElementOf<T>(context);

  if (listen) {
    context.dependOnInheritedWidgetOfExactType<_InheritedProviderScope<T?>>();
  }

  if (value is! T) {
    throw ProviderNullException(T, context.widget.runtimeType);
  }
  return value as T;
}
''',
        '''
static List<SingleChildWidget> _collapseProviders(
  List<SingleChildWidget> providers,
) {
  for (final provider in providers) {
    if (provider is InheritedProvider) {
      final builder = (Widget? child) =>
        provider._buildWithChild(child, key: provider.key);
      previous = builder;
    }
  }
  return [SingleChildBuilder(builder: (context, child) => previous!(child))];
}
''',
        '''
void _listen() {
  if (value is ChangeNotifier) {
    (value as ChangeNotifier).addListener(_handleValueChanged);
  }
}

void _handleValueChanged() {
  setState(() {});
}
''',
      ],
      'updatedAt': '2024-01-20T10:00:00.000Z',
    },
    {
      'name': 'flutter_hooks',
      'publisher': 'dash-overflow.net',
      'description': 'A Flutter implementation of React hooks for enhanced code reuse',
      'version': '0.21.3',
      'likes': 2300,
      'pubPoints': 160,
      'popularity': 89,
      'platforms': ['Flutter'],
      'tags': ['hooks', 'state-management', 'reusable'],
      'logoUrl': null,
      'snippets': [
        '''
void _unmountAllRemainingHooks() {
  if (_currentHookState != null) {
    _needDispose ??= LinkedList();
    while (_currentHookState != null) {
      final previousHookState = _currentHookState!;
      _currentHookState = _currentHookState!.next;
      previousHookState.unlink();
      _needDispose!.add(previousHookState);
    }
  }
}
''',
        '''
R _use<R>(Hook<R> hook) {
  if (hook.runtimeType != _currentHookState!.value.hook.runtimeType) {
    _unmountAllRemainingHooks();
    throw StateError(
      'Type mismatch: \${_currentHookState!.value.hook.runtimeType} != \${hook.runtimeType}'
    );
  }
  return _currentHookState!.value.build(context);
}
''',
        '''
@override
Widget build() {
  final mustRebuild = _isOptionalRebuild != true ||
    _shouldRebuildQueue.any((cb) => cb.value());

  if (!mustRebuild) {
    return _buildCache!;
  }

  _currentHookState = _hooks.isEmpty ? null : _hooks.first;
  HookElement._currentHookElement = this;
  _buildCache = super.build();
  return _buildCache!;
}
''',
      ],
      'updatedAt': '2024-01-18T10:00:00.000Z',
    },
    {
      'name': 'dart_frog',
      'publisher': 'dart-frog.dev',
      'description': 'A fast, minimalistic backend framework for Dart',
      'version': '1.2.4',
      'likes': 815,
      'pubPoints': 160,
      'popularity': 85,
      'platforms': ['Dart'],
      'tags': ['backend', 'server', 'framework'],
      'logoUrl': null,
      'snippets': [
        '''
typedef Middleware = Handler Function(Handler handler);
''',
        '''
extension HandlerUse on Handler {
  Handler use(Middleware middleware) {
    const pipeline = Pipeline();
    return pipeline
      .addMiddleware(middleware)
      .addHandler(this);
  }
}
''',
        '''
class Pipeline {
  final List<Middleware> _middleware = [];

  Pipeline addMiddleware(Middleware middleware) {
    _middleware.add(middleware);
    return this;
  }

  Handler addHandler(Handler handler) {
    return _middleware.reversed.fold(
      handler,
      (handler, middleware) => middleware(handler),
    );
  }
}
''',
      ],
      'updatedAt': '2024-01-16T10:00:00.000Z',
    },
    {
      'name': 'flutter_inappwebview',
      'publisher': 'inappwebview.dev',
      'description': 'A Flutter plugin for inline webview, headless webview, and in-app browser',
      'version': '6.1.5',
      'likes': 2750,
      'pubPoints': 140,
      'popularity': 96,
      'platforms': ['Flutter'],
      'tags': ['webview', 'browser', 'web'],
      'logoUrl': null,
      'snippets': [
        '''
void addJavaScriptHandler({
  required String handlerName,
  required Function callback
}) => platform.addJavaScriptHandler(
  handlerName: handlerName,
  callback: callback
);
''',
        '''
InAppWebViewController.fromPlatformCreationParams({
  required PlatformInAppWebViewControllerCreationParams params,
}) : this.fromPlatform(
  platform: PlatformInAppWebViewController(params)
);
''',
        '''
Future<void> loadUrl({
  required URLRequest urlRequest,
  WebUri? allowingReadAccessTo
}) => platform.loadUrl(
  urlRequest: urlRequest,
  allowingReadAccessTo: allowingReadAccessTo
);
''',
      ],
      'updatedAt': '2024-01-12T10:00:00.000Z',
    },
    {
      'name': 'build_runner',
      'publisher': 'tools.dart.dev',
      'description': 'A build system for Dart code generation and modular compilation',
      'version': '2.9.0',
      'likes': 2200,
      'pubPoints': 160,
      'popularity': 99,
      'platforms': ['Dart'],
      'tags': ['codegen', 'build', 'tools'],
      'logoUrl': null,
      'snippets': [
        '''
Future<BuildResult> run(
  List<BuilderApplication> builders,
  BuildPhaseFactory phaseFactory,
) async {
  for (final application in builders) {
    final phase = phaseFactory.createPhase(application);
    await phase.run();
  }
  return BuildResult(BuildStatus.success, []);
}
''',
        '''
class AssetGraph {
  final Map<AssetId, AssetNode> _nodes = {};

  void add(AssetId id, Iterable<AssetId> outputs) {
    _nodes[id] = AssetNode(id, outputs.toSet());
  }

  bool contains(AssetId id) => _nodes.containsKey(id);
}
''',
        '''
class BuilderApplication {
  final String builderKey;
  final List<String> generateFor;
  final BuilderOptions options;

  const BuilderApplication(
    this.builderKey,
    this.generateFor,
    this.options,
  );
}
''',
      ],
      'updatedAt': '2024-01-14T10:00:00.000Z',
    },
  ];
}
