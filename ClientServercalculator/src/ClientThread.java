import java.io.*;
import java.net.*;

/*
 * The client thread. This client thread opens the input and the output
 * streams for a particular client. It returns back responses for all calculations asked by client 
 * also tells how many clients are currently connected to the server.
  */
class ClientThread extends Thread {

	// variable declaration
	BufferedReader br = null;
	PrintWriter pw = null;
	Socket clientSocket = null;
	String requestLine;
	String responseLine;
	String firstNum = "";
	String secondNum = "";
	String operator = "";
	double result = 0.0;
	int result1 = 0;

	/*constructor to initialize client socket *****************************************************
	 */
	public ClientThread(Socket clientSocket) {
		this.clientSocket = clientSocket;
	}

	/*Abstract method from class Thread which performs all the processing **************************
	 */
	public void run() {
		try {
			// input and output connection to client socket
			br = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
			pw = new PrintWriter(clientSocket.getOutputStream(), true);

		} catch (IOException e) {
			System.out.println("IO error in server thread");
		}

		try {
			requestLine = br.readLine(); // reading client request
			// while loop continues till client is connected
			while (!requestLine.equalsIgnoreCase("exit")) {
				
				// if loop to check the type of request
				if (requestLine.equalsIgnoreCase("count")) {
					result = Serverside.getClientCount();
					// sends back the number of clients connected currently to server
					responseLine = Double.toString(result);
					pw.println(requestLine + '=' + responseLine
							+ "  ::: Enter expression to be calculated using expression +,-,/,//,"
							+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
					result = 0.0;
				} else {
					if (!Character.isDigit(requestLine.charAt(0))) {
						// greeting the newly entered client
						pw.println(
								"Hello " + requestLine + " Enter expression to be calculated using expression +,-,/,//,"
										+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
					} else {

						// processing the mathematicall expression requested by client
						firstNum = "";
						secondNum = "";
						operator = "";
						for (int i = 0; i < requestLine.length(); i++) {
							
							// extracting the operator requested in expression sent by client
							if (requestLine.charAt(i) == '+' || requestLine.charAt(i) == '-'
									|| requestLine.charAt(i) == '/' || requestLine.charAt(i) == '%'
									|| requestLine.charAt(i) == '*') {
								if (requestLine.charAt(i + 1) == '/') {
									operator = Character.toString(requestLine.charAt(i));
									i++;
								}
								operator = operator + Character.toString(requestLine.charAt(i));
								System.out.println("Operator:" + operator);
								i++;
								for (int k = i; k < requestLine.length(); k++) {
									// extracting the second number in the expression requested by client
									secondNum = secondNum + Character.toString(requestLine.charAt(k));
								}
								break;
							} else {
								// extrating the second number in the expression requested by client
								firstNum = firstNum + Character.toString(requestLine.charAt(i));
							}
						}
						
						// typecasting string to double
						double num1 = Double.parseDouble(firstNum);
						double num2 = Double.parseDouble(secondNum);
						
						/* checking the operation and performing the equivalent calculation and 
						 * responsing back to client
						 */
						if (operator.equals("+")) {
							result = num1 + num2;
							responseLine = Double.toString(result);
							pw.println(requestLine + '=' + responseLine
									+ "  :::Enter expression to be calculated using expression +,-,/,//,"
									+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
							result = 0.0;
						} else {
							if (operator.equals("-")) {
								result = num1 - num2;
								responseLine = Double.toString(result);
								pw.println(requestLine + '=' + responseLine
										+ "  :::Enter expression to be calculated using expression +,-,/,//,"
										+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
								result = 0.0;
							} else {
								if (operator.equals("/")) {
									result = num1 / num2;
									responseLine = Double.toString(result);
									pw.println(requestLine + '=' + responseLine
											+ "  :::Enter expression to be calculated using expression +,-,/,//,"
											+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
									result = 0.0;
								} else {
									if (operator.equals("*")) {
										result = num1 * num2;
										responseLine = Double.toString(result);
										pw.println(requestLine + '=' + responseLine
												+ "  :::Enter expression to be calculated using expression +,-,/,//,"
												+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
										result = 0.0;
									} else {
										if (operator.equals("%")) {
											result = num1 % num2;
											responseLine = Double.toString(result);
											pw.println(requestLine + '=' + responseLine
													+ "  :::Enter expression to be calculated using expression +,-,/,//,"
													+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
											result = 0.0;
										} else {
											if (operator.equals("//")) {
												result = num1 / num2;
												result1 = (int) result;
												responseLine = Integer.toString(result1);
												pw.println(requestLine + '=' + responseLine
														+ "  :::Enter expression to be calculated using expression +,-,/,//,"
														+ "%,* or COUNT to get total client connected or EXIT to exit from server.");
												result1 = 0;
											}
										}
									}

								}
							}
						}
					}
				}

				requestLine = br.readLine();// getting the next request from client
			}
			
			// Closing a connection for a client who wants to exit and decreasing the count by 1
			if (requestLine.equalsIgnoreCase("exit")) {
				int connectedCount = Serverside.getClientCount();
				connectedCount--;
				Serverside.setClientCount(connectedCount);
			}
		} catch (Exception e) {

			System.out.println("Error in connection " + e.getMessage());
		} finally {
			try {
				System.out.println("Connection Closing..");
				if (br != null) {
					br.close();
					System.out.println(" Socket Input Stream Closed");
				}

				if (pw != null) {
					pw.close();
					System.out.println("Socket Out Closed");
				}
				if (clientSocket != null) {
					clientSocket.close();
					System.out.println("Socket Closed");
				}

			} catch (IOException ie) {
				System.out.println("Socket Close Error");
			}
		} // end finally
	}
}