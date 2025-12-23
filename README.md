.skills {
  padding: 80px 10%;
}

.skills .title {
  text-align: center;
  font-size: 36px;
  margin-bottom: 50px;
}

.skills .title span {
  color: #ff00ff;
}

.skills-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 25px;
}

.skill-card {
  background: rgba(255, 255, 255, 0.05);
  border: 2px solid #ff00ff;
  border-radius: 12px;
  padding: 22px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.skill-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);
}

.skill-card h3 {
  color: #ff00ff;
  font-size: 20px;
  margin-bottom: 15px;
}

.skill-card ul {
  padding-left: 18px;
}

.skill-card ul li {
  font-size: 14px;
  margin-bottom: 8px;
  line-height: 1.5;
}
