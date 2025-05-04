import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'servicios_page.dart';
import 'nosotros_page.dart';
import 'contacto_page.dart';
import 'login_page.dart';
import 'perfil.dart';
import 'cuadro_notas.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Nav Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  final List<String> _routes = [
    '/inicio',
    '/servicios',
    '/nosotros',
    '/contacto',
    '/login',
    '/perfil',
    '/notas',
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _navigatorKey.currentState!.pushReplacementNamed(_routes[index]);
  }

  void _handleSwipe(DragEndDetails details) {
    const minVelocity = 300;
    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! < -minVelocity) {
      if (_selectedIndex < _routes.length - 1) {
        _onItemTapped(_selectedIndex + 1);
      }
    } else if (details.primaryVelocity! > minVelocity) {
      if (_selectedIndex > 0) {
        _onItemTapped(_selectedIndex - 1);
      }
    }
  }

  void _handleTap() {
    if (_selectedIndex == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Tap en Inicio')));
    }
  }

  void _handleLongPress() {
    if (_selectedIndex == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Presion larga en Inicio')));
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _handleSwipe,
      onTap: _handleTap,
      onLongPress: _handleLongPress,
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: '/inicio',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/inicio':
                builder = (context) => const InicioPage();
                break;
              case '/servicios':
                builder = (context) => const ServiciosPage();
                break;
              case '/nosotros':
                builder = (context) => const NosotrosPage();
                break;
              case '/contacto':
                builder = (context) => const ContactoPage();
                break;
              case '/login':
                builder = (context) => const LoginPage();
                break;
              case '/perfil':
                builder = (context) => const PerfilPage();
                break;
              case '/notas':
                builder = (context) => const CuadroNotasPage();
                break;
              default:
                builder = (context) => const InicioPage();
            }
            return PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => builder(context),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0.0, 0.1),
                  end: Offset.zero,
                ).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
              settings: settings,
            );
          },
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF0d1517),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.miscellaneous_services),
                  label: 'Servicios',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Nosotros',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail),
                  label: 'Contacto',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.login),
                  label: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
