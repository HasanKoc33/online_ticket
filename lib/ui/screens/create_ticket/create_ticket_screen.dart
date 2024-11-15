import 'dart:ui';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:online_ticked/core/constants/app_asets.dart';import 'package:online_ticked/core/constants/app_referance.dart';import 'package:online_ticked/core/constants/ticket_state.dart';import 'package:online_ticked/data/models/ticket.dart';import 'package:online_ticked/data/services/firebase_database_service.dart';import 'package:online_ticked/ui/widgets/pdf_preview_screen.dart';import 'package:online_ticked/ui/widgets/pdf_widget.dart';import 'package:online_ticked/util/bildiriler.dart';import 'package:online_ticked/util/extension.dart';import 'package:printing/printing.dart';import 'package:qr_flutter/qr_flutter.dart';import 'package:pdf/pdf.dart';import 'package:pdf/widgets.dart' as pw;import 'create_ticket_screen_mixin.dart';/// CreateTicketScreen ekranıclass CreateTicketScreen extends StatefulWidget {  /// CreateTicketScreen ekranı  const CreateTicketScreen({super.key});  @override  State<CreateTicketScreen> createState() => _CreateTicketScreenState();}class _CreateTicketScreenState extends State<CreateTicketScreen>    with CreateTicketScreenMixin {  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        title: const Text('Bilet Oluştur'),      ),      body: SafeArea(        child: SingleChildScrollView(          child: Column(            children: [              Padding(                padding: const EdgeInsets.all(8.0),                child: Center(child: Image.asset(                  AppAsets.logo.value,                  width: context.width * .5,                )),              ),              Padding(                padding: const EdgeInsets.all(8.0),                child: TextField(                  controller: titleController,                  maxLength: 50,                  decoration: InputDecoration(                    hintText: 'Başlık',                  ),                ),              ),              Padding(                padding: const EdgeInsets.all(8.0),                child: TextField(                  controller: descriptionController,                  maxLength: 200,                  maxLines: 5,                  decoration: InputDecoration(                    hintText: 'Açıklama',                  ),                ),              ),              Padding(                padding: const EdgeInsets.all(8.0),                child: TextField(                  controller: priceController,                  inputFormatters: [                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),                  ],                  decoration: InputDecoration(                    hintText: 'İşlemin Tutarı',                  ),                ),              ),              Padding(                padding: const EdgeInsets.all(8.0),                child: ListTile(                  title: Text('Son Kullanım Tarihi'),                  trailing: Text(finishedAt.date),                  onTap: (){                    showDatePicker(                      context: context,                      initialDate: DateTime.now(),                      firstDate: DateTime.now(),                      lastDate: DateTime(2052),                    ).then((value) {                      if(value == null) return;                      setState(() {                        finishedAt = value;                      });                    });                  },                ),              ),              Center(                child: Padding(                  padding: const EdgeInsets.all(8.0),                  child: FilledButton(                  onPressed: () async {                    final ticket = Ticket(                        id: id,                        title: titleController.text,                        description: descriptionController.text,                        price: double.parse(priceController.text),                        createdAt: DateTime.now().dateNow,                        finishedAt: finishedAt.dateNow,                        state: TicketState.ready,                    );                    FirebaseDatabaseService.instance.addData(                        path: AppReferance.tickets.value + '/$id',                        data: ticket.toMap());                    showDialog(context: context, builder: (context){                      return AlertDialog(                        title: const Text('Bilet Oluşturuldu'),                        content: Column(                          mainAxisSize: MainAxisSize.min,                          children: [                            Text('Bilet Başarıyla Oluşturuldu'),                            FilledButton(onPressed: () async {                              final file = await PdfWidget.instance.createFile(ticket);                              Navigator.of(context).push(MaterialPageRoute(                                builder: (context) => PdfPreviewScreen(file.path),                              ));                            }, child: Text('Bileti Görüntüleyin'),),                            FilledButton(onPressed: (){                              PdfWidget.instance.create(ticket);                            }, child: Text('Bileti Paylaşın'),),                          ],                        ),                      );                    });                  },                  child: Center(child: Text('Hediye Kartı Oluştur')),                ),                ),              ),            ],          ),        ),      ),    );  }}