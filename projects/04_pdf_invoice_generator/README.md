# PDF Invoice Generator

Generate professional PDF invoices from templates and data.

## Status

🚧 **Planned** - This project is in the planning phase.

## Planned Features

- Generate PDF invoices from template
- Read invoice data from CSV or Excel
- Include company logo and branding
- Calculate totals, taxes, and discounts
- Support multiple invoice templates
- Batch generation for multiple invoices

## Technologies

- Python 3.8+
- reportlab or weasyprint (PDF generation)
- Jinja2 (template engine)
- pandas (data reading)

## Example Use Case

```python
# Generate invoice
from generate_invoice import create_invoice

invoice_data = {
    "invoice_number": "INV-001",
    "date": "2026-01-27",
    "client_name": "Acme Corp",
    "items": [
        {"description": "Web Design", "quantity": 1, "price": 1500},
        {"description": "Hosting", "quantity": 12, "price": 50}
    ]
}

create_invoice(invoice_data, output="invoices/INV-001.pdf")
```

## Template Customization

Templates will support:
- Custom colors and fonts
- Company logo placement
- Multiple layouts (simple, detailed, modern)
- Custom footer text

## Future Enhancements

- Email generated invoices automatically
- Integration with payment processors
- Invoice tracking and management
- Multi-currency support

## Getting Started

This project will be developed after mastering file I/O and PDF manipulation.
