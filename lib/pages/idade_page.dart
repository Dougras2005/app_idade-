import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdadePage extends StatefulWidget {
  const IdadePage({super.key});

  @override
  State<IdadePage> createState() => _IdadePageState();
}

class _IdadePageState extends State<IdadePage> {
  TextEditingController idadeController = TextEditingController();
  String resultado = '';
  int idade = 0;


  classificarIdade(){
   idade = int.tryParse(idadeController.text) ?? 0;

  setState(() {
    if (idade < 3) {
    resultado = 'Infância ';
    } else if (idade >= 3 && idade <=12) { 
      resultado = 'Pré-Adolecência';
    } else if (idade >= 13 && idade <=19) { 
      resultado = 'Adolecência';
    } else if (idade >= 20 && idade <=35) { 
      resultado = 'Juventude';
    } else if (idade >= 36 && idade <=55) { 
      resultado = 'Meia-Idade';
    } else { 
      resultado = 'Terceira idade';
    }  
  });
  
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sua fase da Vida é'),
            content: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinhar à esquerda
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(resultado)
              ], // Minimizar a altura da coluna
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  
                },
              ),
            ],
          );
        });
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pela sua Idade você é...'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 74, 142, 221),        
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: idadeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Digíte sua Idade',
                    labelStyle: const TextStyle(fontSize: 18),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                 ],
                  onSubmitted: (value) => classificarIdade(),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: classificarIdade,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sua Classificação',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
            ],
          ),
        ),
      );
  }
}