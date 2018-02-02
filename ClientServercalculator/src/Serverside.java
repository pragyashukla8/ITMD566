import java.io.IOException;
import java.net.Socket;
import java.net.ServerSocket;

/*
 * The server side which accepts the requests from client and starts a new thread for each newly connected 
 * client
  */

public class Serverside {

	private static int clientCount = 0; // to maintain the count of clients connected to the server

	// get method the access client count
	public static int getClientCount() {
		return clientCount;
	}

	// set method to set value for client count
	public static void setClientCount(int clientCount) {
		Serverside.clientCount = clientCount;
	}

	public static void main(String args[]) {

		ServerSocket serverSocket = null;
		Socket clientSocket = null;

		// Open a server socket on port 5150.
		try {
			serverSocket = new ServerSocket(5150);
		} catch (IOException e) {
			System.out.println(e);
		}

		/*
		 * Create a socket object from the ServerSocket to listen to and accept
		 * connections. Open input and output streams.
		 */
		System.out.println("The server started.");
		while (true) {
			try {
				clientSocket = serverSocket.accept();
				clientCount++;
				System.out.println("Connection Established.");
				// new thread for a client
				ClientThread clientThread = new ClientThread(clientSocket);
				clientThread.start();

			} catch (Exception e) {
				System.out.println("Connection Error. " + e);

			}

		}

	}
}