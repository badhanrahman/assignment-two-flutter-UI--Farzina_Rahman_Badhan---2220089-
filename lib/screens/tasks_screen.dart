import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2563EB),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tasks",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Icon(Icons.calendar_today_outlined, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search tasks, courses...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              _sectionHeader("TODAY • FRI, 13 NOV", "3 TASKS"),
              const SizedBox(height: 12),
              _taskItem(
                title: "Lab 6: Navigation and routing",
                course: "CSE 464",
                time: "11:59 PM",
                timeColor: const Color(0xFFEF4444),
                priority: "High",
                badgeBg: const Color(0xFFFEE2E2),
                badgeColor: const Color(0xFFEF4444),
                isDone: false,
              ),
              const SizedBox(height: 10),
              _taskItem(
                title: "Read chapter 7: Normalization",
                course: "CSE 303",
                time: "6:00 PM",
                timeColor: Colors.grey.shade600,
                priority: "Medium",
                badgeBg: const Color(0xFFFEF3C7),
                badgeColor: const Color(0xFFD97706),
                isDone: false,
              ),
              const SizedBox(height: 10),
              _taskItem(
                title: "Submit quiz 3 reflection",
                course: "MAT 212",
                time: "2:00 PM",
                timeColor: Colors.grey.shade500,
                priority: "Low",
                badgeBg: const Color(0xFFD1FAE5),
                badgeColor: const Color(0xFF059669),
                isDone: true,
              ),
              const SizedBox(height: 24),
              _sectionHeader("TOMORROW • SAT, 14 NOV", "2 TASKS"),
              const SizedBox(height: 12),
              _taskItem(
                title: "ER diagram for library system",
                course: "CSE 303",
                time: "5:00 PM",
                timeColor: Colors.grey.shade600,
                priority: "Medium",
                badgeBg: const Color(0xFFFEF3C7),
                badgeColor: const Color(0xFFD97706),
                isDone: false,
              ),
              const SizedBox(height: 10),
              _taskItem(
                title: "Watch lecture 9",
                course: "CSE 464",
                time: "8:00 PM",
                timeColor: Colors.grey.shade600,
                priority: "Low",
                badgeBg: const Color(0xFFD1FAE5),
                badgeColor: const Color(0xFF059669),
                isDone: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          right,
          style: const TextStyle(
            color: Color(0xFF2563EB),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _taskItem({
    required String title,
    required String course,
    required String time,
    required Color timeColor,
    required String priority,
    required Color badgeBg,
    required Color badgeColor,
    required bool isDone,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: isDone ? const Color(0xFF2563EB) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isDone ? const Color(0xFF2563EB) : Colors.grey.shade400,
              ),
            ),
            child: isDone
                ? const Icon(Icons.check, size: 15, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isDone ? Colors.grey.shade500 : Colors.black87,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "$course • ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: timeColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              priority,
              style: TextStyle(
                color: badgeColor,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
