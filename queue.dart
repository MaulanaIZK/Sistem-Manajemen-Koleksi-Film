class Queue {
  List<dynamic> elements = [];
  int front = 0;
  int rear = -1;
  int maxQueue = 0;

  bool isEmpty(){
    return rear == -1 && front == 0;
  }

  void Enqueue(Map<String,String> data){ 
    
    rear += 1;
    elements.add(data);
  }

  void Dequeue() {
    Map<String,String> data = {};

    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      data = elements[front];
      for (int i = front; i < rear; i++){
        elements[i] = elements[i + 1];
      }
      elements.removeAt(rear);
      rear--;
      if (rear == -1) {
        front = -1;
      }
    }
  }
}