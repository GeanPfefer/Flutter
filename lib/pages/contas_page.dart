import 'package:expense_tracker/components/conta_item.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

import '../repository/contas_repositrory.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  final futureContas = ContasRepository().listarContas();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conta>>(
      future: futureContas,
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
                List<Conta> contas = snapshot.data!;

                return ListView.separated(
                itemCount: contas.length,
                itemBuilder: (context, index) {
                  final conta = contas[index];
                  return ContaItem(conta: conta);
                },
                separatorBuilder: (context, index) => const Divider(),
              );
              }
        
      }
    );
  }
}



