package com.SAS.DAO;

import com.mongodb.client.*;
import org.bson.Document;

import org.bson.types.Binary;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;

@WebServlet("/GetImageServlet")
public class GetImageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
	    MongoDatabase database = mongoClient.getDatabase("Codetantra");
	    MongoCollection<Document> collection = database.getCollection("sample_data");

	    Document imageDoc = collection.find(new Document("name", "AddiasAirMax.jpg")).first();

	    if (imageDoc != null) {
	    	Binary imageData = imageDoc.get("sample_data", Binary.class);
	    	byte[] imageBytes = imageData.getData();

	        response.setContentType("image/jpeg"); // or "image/png" based on your image
	        OutputStream out = response.getOutputStream();
	        out.write(imageBytes);
	        out.flush();
	        out.close();
	    } else {
	        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
	    }

	    mongoClient.close();
	}

}
