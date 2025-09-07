package com.SAS.DAO;

import com.mongodb.client.*;
import org.bson.Document;
import org.bson.types.Binary;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/GetImageServlet")
public class GetImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Codetantra");
        MongoCollection<Document> collection = database.getCollection("sample_data");

        String imageName = request.getParameter("name");
        Document imageDoc = collection.find(new Document("name", imageName)).first();

        if (imageDoc != null) {
            Binary imageData = imageDoc.get("image", Binary.class); // Ensure this matches your DB field

            if (imageData == null) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Image data is null");
                mongoClient.close();
                return;
            }

            byte[] imageBytes = imageData.getData();
            String contentType = getServletContext().getMimeType(imageName);
            if (contentType == null) {
                contentType = "application/octet-stream";
            }
            response.setContentType(contentType);

            OutputStream out = response.getOutputStream();
            out.write(imageBytes);
            out.flush();
            out.close();
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
        }

        mongoClient.close();
    }

    // DAO helper method to fetch all image names
    public static java.util.List<String> getAllImageNames() {
        java.util.List<String> imageNames = new java.util.ArrayList<>();
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Codetantra");
        MongoCollection<Document> collection = database.getCollection("sample_data");

        for (Document doc : collection.find()) {
            String name = doc.getString("name");
            if (name != null) {
                imageNames.add(name);
            }
        }

        mongoClient.close();
        return imageNames;
    }
}
