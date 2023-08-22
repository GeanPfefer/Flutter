import 'package:expense_tracker/models/categoria.dart';
import 'package:expense_tracker/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_Item.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final futureCategorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: FutureBuilder<List<Categoria>>(
            future: futureCategorias,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Future não concluida
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Future concluida
                return Center(
                  child: Text('Ocorreu um erro'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //Future concluida com sucesso, sem dados
                return Center(
                  child: Text('Nenhuma categoria cadastrada'),
                );
              } else {
                //Future concluida com sucesso, com dados
                List<Categoria> categorias = snapshot.data!;

                return ListView.separated(
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];
                    return CategoriaItem(categoria: categoria);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              }
            }));
  }
}
