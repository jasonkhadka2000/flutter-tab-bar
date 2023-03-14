import 'package:flutter/material.dart';
import 'package:tabbar/screen1.dart';
import 'package:tabbar/screen2.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {

  List<Widget> _myWidgets=[
    FirstScreen(a: []),
    SecondScreen(),
  ];

  Task t1=Task(taskName: "play cricket", taskStatus: "inprogress");
  Task t2=Task(taskName: "play football", taskStatus: "inprogress");
  Task t3=Task(taskName: "play basketball", taskStatus: "completed");
  Task t4=Task(taskName: "play chess", taskStatus: "completed");


  List<Task> allTask=[];

  int _index=0;
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    allTask=[
      t1,t2,t3,t4,
    ];
  }

  void updateIndex(int index)
  {
    setState(() {
      _index=index;
    });
  }

  Widget tabBar()
  {
    return TabBar(
      onTap: (i) {
        print(i);
        updateIndex(i);
      },
      unselectedLabelColor: Colors.black,
      isScrollable: true,
      labelColor: Colors.black,
      controller: _tabController,
      tabs: [
        Tab(text: "First Screen"),
        Tab(text: "Second screen"),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my app bar"),
      ),
      body: Container(
        child: Column(
          children: [
            // tabBar(),
            // Expanded(child: _myWidgets[_index]),
            ElevatedButton(
                onPressed: (){
                  List<Task> inprogressTasks=[];
                  for(var task in allTask)
                    {
                      if(task.taskStatus=="inprogress")
                        {
                          inprogressTasks.add(task);
                        }
                    }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstScreen(a: inprogressTasks)),
                  );
                },
                child: Text("in progress tasks"),
            ),
            ElevatedButton(
              onPressed: (){
                List<Task> inprogressTasks=[];
                for(var task in allTask)
                {
                  if(task.taskStatus=="completed")
                  {
                    inprogressTasks.add(task);
                  }
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen(a: inprogressTasks)),
                );
              },
              child: Text("completed tasks"),
            ),

          ],
        ),
      ),
    );
  }
}

class Task{
  String taskName;
  String taskStatus;

  Task({
    required this.taskName,
    required this.taskStatus,
    });
}


