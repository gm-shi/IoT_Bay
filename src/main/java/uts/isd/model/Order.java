package uts.isd.model;

import java.io.Serializable;
import java.util.Date;




public class Order implements Serializable {
      private int id;
      private int userId;
      private int paymentId;
      private Date date;
      private int trackingNum;
      private String status;
      private String comment;
      private int cartId;


      public Order(){
      }

      public Order(int id, int userId, int paymentId, Date date, int trackingNum, String status, String comment, int cartId){
            super();
            this.id = id;
            this.userId = userId;
            this.paymentId = paymentId;
            this.date = date;
            this.trackingNum = trackingNum;
            this.status = status;
            this.comment = comment;
            this.cartId = cartId;
      }

      public int getId(){return id;}
      public void setId(int id){this.id = id;}

      public int getUserId(){return userId;}
      public void setUserId(int userId){this.userId = userId;}

      public int getPaymentId(){return paymentId;}
      public void setPaymentId(int paymentId){this.paymentId = paymentId;}

      public Date getDate() {return date;}
      public void setDate(Date date){this.date = date;}

      public int getTrackingNum(){return trackingNum;}
      public void setTrackingNum(int trackingNum){this.trackingNum = trackingNum;}

      public String getStatus(){return status;}
      public void setStatus(String status){this.status = status;}

      public String getComment(){return comment;}
      public void setComment(String comment){this.comment = comment;}

      public int getCartId(){return cartId;}
      public void setCartId(int cartId){this.cartId = cartId;}

      @Override
      public String toString() {
            return "Order{" +
                    "id=" + id +
                    ", userId" + userId +
                    ", paymentId" + paymentId +
                    ", date" + date +
                    ", trackingNumber" + trackingNum +
                    ", status" + status +
                    ", comment" + comment +
                    ", cartId" + cartId +
                    "}";
      }


}
