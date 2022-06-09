class Chat {
  final String name;
  final String message;
  final String time;
  final String userImage;
  final int noUnseenmsg;
  final String lastMessageType;
  final bool seen;
  final bool recieved;

  Chat(
    this.name,
    this.message,
    this.time,
    this.noUnseenmsg,
    this.recieved,
    this.seen,
    this.lastMessageType,
    this.userImage,
  );
}
