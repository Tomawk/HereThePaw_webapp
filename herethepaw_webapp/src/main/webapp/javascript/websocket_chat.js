var websocket;

const LOGIN = "&LOGIN";
const LOGOUT = "&LOGOUT";
const PING = "&PING";

var username = "";

const server_url = "ws://localhost:3307"

var id_timer = null;

function keep_connection_alive(){
    const timeout = 20000;
    if(websocket.readyState === websocket.OPEN)
        websocket.send(PING);
    id_timer = setTimeout(keep_connection_alive, timeout);
}

function stop_keep_alive(){
    clearTimeout(id_timer);
}

function ws_onOpen() {
    websocket.send(LOGIN + ":" + username);
    keep_connection_alive();
}

function ws_onClose() {

}

function print_message(sender_name, message) {
    const data = new Date();
    const string_date = data.getMinutes() + "" +
        ":" + data.getHours() + "" +
        " " + data.getDay() + "" +
        "/" + data.getMonth() + "" +
        "/" + data.getFullYear();
    //TODO: stampare in pagina html
    if(sender_name == null){
        // messaggio dal server
    } else {
        // messaggio da un altro utente
    }
}

function ws_onMessage(event) {
    const message_fields = event.data.split(':');
    if(message_fields.length === 2){
        //normale messaggio inviato da un altro utente
        print_message(message_fields[0], message_fields[1]);
    } else {
        // semplice stringa di risposta
        print_message(null, event.data);
    }
}

//logging_user is the username of the user that is entering in the chat page
function connect(logging_user){
    username = logging_user;
    websocket = new WebSocket(server_url);
    websocket.onopen = function(){ws_onOpen()};
    websocket.onclose = function(){ws_onClose()};
    websocket.onmessage = function(event){ws_onMessage(event)};
}

function disconnect(){
    websocket.send(LOGOUT);
    websocket.close();
}