
const chat_id = document.getElementById('chat_id').name

App.notifications = App.cable.subscriptions.create({
  channel: `message:chat_${chat_id}`
}, {
      container() {
          const container = document.getElementById('message_window');
          return container;
      },

      connected() {
          console.log('Connected to websocket server ');
      },

      disconnected() {
          console.log('Disconneced');
      },

      received(data) {
        console.log('received data')
          let node = document.createElement('p');
          node.innerHTML = data.message;
          this.container().appendChild(node)
          setTimeout(() => {
              // Remove the node after 3 seconds
              this.container().removeChild(node);
          }, 3000);
      },

  }
);
