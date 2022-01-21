package it.unipi.dsmt.ejb;

import it.unipi.dsmt.dto.ReviewDTO;
import it.unipi.dsmt.interfaces.ReviewRemote;

import javax.ejb.Stateless;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Stateless
public class ReviewRemoteEJB implements ReviewRemote {

    private static DataSource dataSource = null;

    public ReviewRemoteEJB() throws NamingException {
        Context ctx = new InitialContext();
        dataSource = (DataSource) ctx.lookup("jdbc/dsmt_project");
    }

    @Override
    public ArrayList<ReviewDTO> getPetSitterReviewList(String petSitter) throws SQLException {
        ArrayList<ReviewDTO> returned_list = new ArrayList<ReviewDTO>();
            Connection con = dataSource.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from review r inner join users u1 inner join users u2 where r.pet_sitter = " +
                    "u1.user_id AND r.owner = u2.user_id AND u1.username='" + petSitter + "' "); //Retrieve all review about this pet sitter
            while (rs.next()) {
                ReviewDTO reviewDTO = new ReviewDTO(rs.getInt(1), rs.getString(2), rs.getString(21), rs.getString(3),
                        rs.getString(4), rs.getInt(5), rs.getTimestamp(6));
                returned_list.add(reviewDTO);
            }
            return returned_list;
    }


    @Override
    public void insertReview(String owner, String pet_sitter, String text, int rating) throws SQLException {

        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement();
        Timestamp now = new Timestamp(System.currentTimeMillis());

        stmt.executeUpdate("INSERT INTO review (owner, pet_sitter, text, rating, timestamp) VALUES (" +
                owner  + "," + pet_sitter + "," + text + "," + rating + "," + now); //Retrieve all review about this pet sitter

    }


    @Override
    public void deleteReview(int reviewId) throws SQLException {

        Connection con = dataSource.getConnection();

        String query = "DELETE FROM review WHERE id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, reviewId);

        preparedStmt.execute();

    }
    }