import java.io.*;
import java.net.*;
import java.util.Scanner;

/*
 * The client side which connects to the server via port 5150 and sends request and receive the response
  */

public class Clientside {

	public static void main(String[] args) {
		// Declarations of variables
		Socket clientSocket = null;
		Scanner scanner = new Scanner(System.in);
		String strUserName;
		String responseString;

		try {
			// instructions
			System.out.println("Enter the UserName of your choice. It can be you own name.\n");

			// get user name from the client
			strUserName = "temp";
			do {
				System.out.print("Enter User Name: ");
				strUserName = scanner.nextLine();
			} while (strUserName.equals("")); // repeat until valid user name is given

			// --------------------------------------------------------------
			// create a socket to connect to server.
			// After that manage the connection in a while loop
			// until user wants to exit on his/her will
			// --------------------------------------------------------------

			// create a new socket
			clientSocket = new Socket("localhost", 5150); // port is 5150

			// Connection successful at this point, so inform user about this
			System.out.print("Connection successful.");

			// Declarations to manage connection
			// ---------------------------------
			String inputRequest;
			// to get data to and from server
			OutputStream outputStream = clientSocket.getOutputStream();
			BufferedReader response = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
			PrintWriter pr = new PrintWriter(outputStream, true);

			// send user name to the server
			pr.println(strUserName);
			responseString = response.readLine();
			System.out.println(responseString);

			// The Do-while loop
			// --------------

			do {
				inputRequest = scanner.nextLine();
				pr.println(inputRequest);
				if (!inputRequest.equalsIgnoreCase("exit")) {
					responseString = response.readLine();
					System.out.println(responseString);
				}
			} while (!inputRequest.equalsIgnoreCase("exit"));

			// At this point client wants to disconnect from the server,
			// so close the connection
			clientSocket.close();

		} // End of try
		catch (Exception e) {
			System.out.println("Some kind of error has occurred.");
			System.exit(0);
		} // End of exception

	} // End of main()
} // End of class}
