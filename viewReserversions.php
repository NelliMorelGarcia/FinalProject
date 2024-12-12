 <html>
<head><title>View Reservations</title></head>
<?php if (empty($reservations)): ?>
    <p>No reservations found.</p>
<?php else: ?>
    <table>
        <tr>
            <th>Reservation ID</th>
            <th>Customer ID</th>
            <th>Reservation Time</th>
            <th>Number of Guests</th>
            <th>Special Requests</th>
        </tr>
        <?php foreach ($reservations as $reservation): ?>
        <tr>
            <td><?= htmlspecialchars($reservation['reservationId']) ?></td>
            <td><?= htmlspecialchars($reservation['customerId']) ?></td>
            <td><?= htmlspecialchars($reservation['reservationTime']) ?></td>
            <td><?= htmlspecialchars($reservation['numberOfGuests']) ?></td>
            <td><?= htmlspecialchars($reservation['specialRequests']) ?></td>
       
        <a href="index.php?action=reservations&tab=viewReservations&delete=<?= $reservation['reservationId'] ?>" onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
<?php endif; ?>