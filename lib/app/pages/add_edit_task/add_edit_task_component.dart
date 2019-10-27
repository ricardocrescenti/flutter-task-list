import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';
import 'package:simple_form/fields/simple_combo_box_field.dart';
import 'package:simple_form/simple_form.dart';
import 'package:task_list/app/pages/add_edit_task/add_edit_task_controller.dart';
import 'package:task_list/models/task_model.dart';

class AddEditTaskComponent extends Component<AddEditTaskController> {

  @override
  initController(context, module) {
    TaskModel task = ModalRoute.of(context).settings.arguments as TaskModel;
    return AddEditTaskController(module, task);
  }

  @override
  Widget build(BuildContext context, Module module, AddEditTaskController controller) {
    
    return Scaffold(
      appBar: buildAppBar(context, controller),
      body: buildBody(context, controller),
    );

  }

  buildAppBar(BuildContext context, AddEditTaskController controller) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => controller.cancel(context),
      ),
      title: Text('Tarefa'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () => controller.save(context),
        )
      ],
    );
  }
  buildBody(BuildContext context, AddEditTaskController controller) {
    return SingleChildScrollView(
      child:   Container(
        padding: EdgeInsets.all(10),
        child: SimpleForm(
          key: controller.formState,
          initialValues: controller.formValues.values,
          onChange: controller.formValues.setValue,
          child: LayoutForm(
            builder: (LayoutForm layout) {
              return layout.rows([
                layout.columns([
                  layout.field(1, SimpleDateField(fieldName: 'date', title: 'Date to do',)),
                ]),
                layout.columns([
                  layout.field(1, SimpleTextField(fieldName: 'task', title: 'Task')),
                ]),
                layout.columns([
                  layout.field(1, SimpleTextField(fieldName: 'notes', title: 'Notes', maxLines: 5,)),
                ]),
                layout.columns([
                  layout.field(1, SimpleSwitchField(fieldName: 'complete', title: 'Is Complete',)),
                ]),
                layout.columns([
                  layout.field(1, SimpleComboBoxField<TaskType>(fieldName: 'taskType', title: 'Type', items: [TaskType.Call, TaskType.Meeting],)),
                ]),
                RaisedButton(
                  child: Text('Time dialog text'),
                  onPressed: () => controller.showTime(context),
                ),
              ]);
            }
          )
        ),
      ),
    );
  }
}