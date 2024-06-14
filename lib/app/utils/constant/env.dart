class Env {
  Env(this.baseUrl, {this.devMode = false});

  String baseUrl;
  bool devMode;

  static bool loginUsingToken = false;
}

mixin EnvValue {
  static final Env development = Env('http://10.103.0.55:3000');
}
