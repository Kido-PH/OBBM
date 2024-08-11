<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/assets/css/mainStyle.css" />
<link rel="stylesheet" href="/assets/css/customStyle.css" />
</head>
<body>
<footer class="footer">
      <div
        class="footer-top"
        style="background-image: url('/assets/images/footer-illustration.png')"
      >
        <div class="container">
          <div class="footer-brand">
            <a href="" class="logo">OBBM<span class="span">.</span></a>

            <p class="footer-text">
              Financial experts support or help you to to find out which way you
              can raise your funds more.
            </p>

            <ul class="social-list">
              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-facebook"></ion-icon>
                </a>
              </li>

              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-twitter"></ion-icon>
                </a>
              </li>

              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-instagram"></ion-icon>
                </a>
              </li>

              <li>
                <a href="#" class="social-link">
                  <ion-icon name="logo-pinterest"></ion-icon>
                </a>
              </li>
            </ul>
          </div>

          <ul class="footer-list">
            <li>
              <p class="footer-list-title">Contact Info</p>
            </li>

            <li>
              <p class="footer-list-item">+1 (062) 109-9222</p>
            </li>

            <li>
              <p class="footer-list-item">Info@YourGmail24.com</p>
            </li>

            <li>
              <address class="footer-list-item">
                153 Williamson Plaza, Maggieberg, MT 09514
              </address>
            </li>
          </ul>

          <ul class="footer-list">
            <li>
              <p class="footer-list-title">Opening Hours</p>
            </li>

            <li>
              <p class="footer-list-item">Monday-Friday: 08:00-22:00</p>
            </li>

            <li>
              <p class="footer-list-item">Tuesday 4PM: Till Mid Night</p>
            </li>

            <li>
              <p class="footer-list-item">Saturday: 10:00-16:00</p>
            </li>
          </ul>

          <form action="" class="footer-form">
            <p class="footer-list-title">Book a banquet</p>

            <div class="input-wrapper">
              <input
                type="text"
                name="full_name"
                required
                placeholder="Your Name"
                aria-label="Your Name"
                class="input-field"
              />

              <input
                type="email"
                name="email_address"
                required
                placeholder="Email"
                aria-label="Email"
                class="input-field"
              />
            </div>

            <div class="input-wrapper">
              <select
                name="total_person"
                aria-label="Total person"
                class="input-field"
              >
                <option value="person">Person</option>
                <option value="2 person">2 Person</option>
                <option value="3 person">3 Person</option>
                <option value="4 person">4 Person</option>
                <option value="5 person">5 Person</option>
              </select>

              <input
                type="date"
                name="booking_date"
                aria-label="Reservation date"
                class="input-field"
              />
            </div>

            <textarea
              name="message"
              required
              placeholder="Message"
              aria-label="Message"
              class="input-field"
            ></textarea>

            <button type="submit" class="btn">Book a Table</button>
          </form>
        </div>
      </div>

      <div class="footer-bottom">
        <div class="container">
          <p class="copyright-text">
            &copy; 2024 <a href="#" class="copyright-link">L&P Team</a> All
            Rights Reserved.
          </p>
        </div>
      </div>
    </footer>

    <a
      href="#top"
      class="back-top-btn"
      aria-label="Back to top"
      data-back-top-btn
    >
      <ion-icon name="chevron-up"></ion-icon>
    </a>

    <!-- bootstrap -->
    <script src="/assets/js/script.js" defer></script>
    
</body>
</html>