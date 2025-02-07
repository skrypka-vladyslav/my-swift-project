import Foundation

class NotificationService {
    let botToken = "your-telegram-bot-token"
    let chatID = "your-chat-id"
    
    func sendNotification(message: String) {
        let url = URL(string: "https://api.telegram.org/bot\(botToken)/sendMessage?chat_id=\(chatID)&text=\(message)")!
        let task = URLSession.shared.dataTask(with: url)
        task.resume()
    }
}
