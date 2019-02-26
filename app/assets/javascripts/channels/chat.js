
document.addEventListener('turbolinks:load', () =>{
    const chatId = document.getElementById('chat_id').value
    App.notifications = App.cable.subscriptions.create({
        channel: "ChatChannel", chat_id: chatId
      }, {
            container() {
                const container = document.getElementById('message_window');
                return container;
            },
      
            connected() {
                console.log(`Connected to message:chat_${chatId}`);
            },
      
            disconnected() {
                console.log('Disconneced');
            },
      
            received(data) {
                let node = document.createElement('p');
                node.innerText = `${data.from} says: ${data.message}`;
                this.container().appendChild(node)
            },
      
        }
      );
})
