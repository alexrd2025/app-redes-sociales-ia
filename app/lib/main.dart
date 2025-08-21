import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Redes Sociales IA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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
  String selectedPage = "publicar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App IA Redes Sociales"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Menú", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              title: const Text("Publicar en tus redes sociales"),
              leading: const Icon(Icons.send),
              onTap: () {
                setState(() {
                  selectedPage = "publicar";
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Análisis de mercado local"),
              leading: const Icon(Icons.analytics),
              onTap: () {
                setState(() {
                  selectedPage = "analisis";
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _getPage(),
    );
  }

  Widget _getPage() {
    if (selectedPage == "publicar") {
      return const PublicarPage();
    } else {
      return const AnalisisPage();
    }
  }
}

class PublicarPage extends StatelessWidget {
  const PublicarPage({super.key});

  void _simularPublicacion(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✅ Publicación enviada a Facebook (simulada)"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Generar anuncio con IA y publicar en Facebook",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _simularPublicacion(context),
            icon: const Icon(Icons.send),
            label: const Text("Publicar anuncio"),
          ),
        ],
      ),
    );
  }
}

class AnalisisPage extends StatelessWidget {
  const AnalisisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "📊 Aquí irá el análisis de mercado local",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}